// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Dart imports:
import 'dart:html' as html;

// Project imports:
import 'base_web_auth.dart';

BaseWebAuth createWebAuth() => BrowserWebAuth();

class BrowserWebAuth implements BaseWebAuth {
  @override
  Future<String> authenticate({
    required String callbackUrlScheme,
    required Uri uri,
    required String redirectUrl,
  }) async {
    // ignore: unsafe_html
    final popupLogin = html.window.open(
        uri.toString(),
        'mastodon_oauth2::authenticateWindow',
        'menubar=no, status=no, scrollbars=no, '
            'menubar=no, width=1000, height=500');

    final messageEvt = await html.window.onMessage.firstWhere(
      (evt) => evt.origin == Uri.parse(redirectUrl).origin,
    );

    popupLogin.close();

    return messageEvt.data;
  }
}
