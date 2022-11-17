// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Package imports:
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

// Project imports:
import 'base_web_auth.dart';

BaseWebAuth createWebAuth() => IoWebAuth();

class IoWebAuth implements BaseWebAuth {
  @override
  Future<String> authenticate({
    required String callbackUrlScheme,
    required Uri uri,
    required String redirectUrl,
  }) async =>
      await FlutterWebAuth2.authenticate(
        callbackUrlScheme: callbackUrlScheme,
        url: uri.toString(),
      );
}
