// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

abstract class BaseWebAuth {
  Future<String> authenticate({
    required String callbackUrlScheme,
    required Uri uri,
    required String redirectUrl,
  });
}
