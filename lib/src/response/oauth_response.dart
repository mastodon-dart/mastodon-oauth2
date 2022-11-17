// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../scope.dart';

part 'oauth_response.freezed.dart';
part 'oauth_response.g.dart';

@freezed
class OAuthResponse with _$OAuthResponse {
  const factory OAuthResponse({
    required String accessToken,
    required String tokenType,
    @JsonKey(name: 'scope') @ScopeConverter() required List<Scope> scopes,
    @DateTimeConverter() required DateTime createdAt,
  }) = _OAuthResponse;

  factory OAuthResponse.fromJson(Map<String, Object?> json) =>
      _$OAuthResponseFromJson(json);
}

class ScopeConverter implements JsonConverter<List<Scope>, String> {
  const ScopeConverter();

  @override
  List<Scope> fromJson(final String scope) =>
      scope.split(' ').map((e) => Scope.valueOf(e)).toList();

  @override
  String toJson(final List<Scope> scopes) =>
      scopes.map((e) => e.value).toList().join(' ');
}

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(final int json) => DateTime.parse(json.toString());

  @override
  int toJson(final DateTime json) => json.toUtc().millisecondsSinceEpoch;
}
