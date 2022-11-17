// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'auth/base_web_auth.dart';
import 'auth/web_auth.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'auth/io_web_auth.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'auth/browser_web_auth.dart';
import 'mastodon_oauth_exception.dart';
import 'response/authorization_response.dart';
import 'response/oauth_response.dart';
import 'scope.dart';

/// This client authenticates according to `OAuth 2.0`, which
/// is supported by `Mastodon`.
///
/// To authenticate to a specific `Mastodon instance` and obtain
/// an `access token`, run [executeAuthCodeFlow].
abstract class MastodonOAuth2Client {
  /// Returns the new instance of [MastodonOAuth2Client].
  ///
  /// ## Parameters
  ///
  /// - [instance]: Specify the `mastodon instance` for which you want to
  ///               authenticate.
  ///
  /// - [clientId]: The unique ID of your client application.
  ///
  /// - [clientSecret]: The unique secret ID of your client application.
  ///
  /// - [redirectUri]: Specify the redirect URI of the configured client
  ///                  application.
  ///
  /// - [customUriScheme]: Specify a redirect URI without the `://xxxx` suffix.
  factory MastodonOAuth2Client({
    required String instance,
    required String clientId,
    required String clientSecret,
    required String redirectUri,
    required String customUriScheme,
  }) =>
      _MastodonOAuth2Client(
        instance: instance,
        clientId: clientId,
        clientSecret: clientSecret,
        redirectUri: redirectUri,
        customUriScheme: customUriScheme,
      );

  /// Performs the authentication process according to `OAuth 2.0` and outputs
  /// the `Mastodon authentication form`.
  ///
  /// If the Mastodon authentication form is successful, an object with an
  /// `access token` is returned.
  ///
  /// ## Parameters
  ///
  /// - [scopes]: Specify the list of scopes of privileges you want to grant
  ///             to the authenticated access token.
  ///
  /// - [forceLogin]: Forces the user to re-login, which is necessary
  ///                 for authorizing with multiple accounts from the same
  ///                 instance.
  Future<OAuthResponse> executeAuthCodeFlow({
    required List<Scope> scopes,
    bool forceLogin = false,
  });
}

/// The implementation of [MastodonOAuth2Client].
class _MastodonOAuth2Client implements MastodonOAuth2Client {
  /// Returns the new instance of [_MastodonOAuth2Client].
  _MastodonOAuth2Client({
    required String instance,
    required String clientId,
    required String clientSecret,
    required String redirectUri,
    required String customUriScheme,
  })  : _instance = instance,
        _clientId = clientId,
        _clientSecret = clientSecret,
        _redirectUri = redirectUri,
        _customUriScheme = customUriScheme;

  /// The authority for specific server
  final String _instance;

  final String _clientId;
  final String _clientSecret;
  final String _redirectUri;
  final String _customUriScheme;

  final BaseWebAuth _webAuthClient = createWebAuth();

  @override
  Future<OAuthResponse> executeAuthCodeFlow({
    required List<Scope> scopes,
    bool forceLogin = false,
  }) async {
    final response = await _requestAuthorization(
      scopes: scopes,
      forceLogin: forceLogin,
    );

    return await _requestAccessToken(
      code: response.code,
      scopes: scopes,
    );
  }

  Future<AuthorizationResponse> _requestAuthorization({
    required List<Scope> scopes,
    required bool forceLogin,
  }) async {
    final redirectedUri = await _webAuthClient.authenticate(
      uri: Uri.https(
        _instance,
        '/oauth/authorize',
        {
          'response_type': 'code',
          'client_id': _clientId,
          'redirect_uri': _redirectUri,
          'scope': scopes.map((scope) => scope.value).join(' '),
          'force_login': forceLogin.toString(),
        },
      ),
      callbackUrlScheme: _customUriScheme,
      redirectUrl: _redirectUri,
    );

    final queryParameters = Uri.parse(redirectedUri).queryParameters;

    if (queryParameters.containsKey('error')) {
      throw MastodonOAuthException(queryParameters['error_description'] ?? '');
    }

    return AuthorizationResponse(
      code: queryParameters['code']!,
    );
  }

  Future<OAuthResponse> _requestAccessToken({
    required List<Scope> scopes,
    required String code,
  }) async {
    final response = await http.post(
      Uri.https(_instance, '/oauth/token'),
      body: {
        'grant_type': 'authorization_code',
        'client_id': _clientId,
        'client_secret': _clientSecret,
        'redirect_uri': _redirectUri,
        'scope': scopes.map((e) => e.value).toList().join(' '),
        'code': code,
      },
    );

    return OAuthResponse.fromJson(jsonDecode(response.body));
  }
}
