// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

/// Thrown to indicate a failure in OAuth 2.0 authentication,
/// which is supported by `Mastodon`.
class MastodonOAuthException implements Exception {
  /// Returns the new instance of [MastodonOAuthException].
  const MastodonOAuthException(this.message);

  /// The error message.
  final String message;

  @override
  String toString() => 'MastodonOAuthException: $message';
}
