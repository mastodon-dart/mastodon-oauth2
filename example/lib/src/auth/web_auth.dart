// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Project imports:
import 'base_web_auth.dart';

/// Implemented in `browser_client.dart` and `io_client.dart`.
BaseWebAuth createWebAuth() => throw UnsupportedError(
    'Cannot create a web auth without dart:html or dart:io.');
