// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'package:flutter_test/flutter_test.dart';
import 'package:mastodon_oauth2/src/scope.dart';

void main() {
  test('.name', () {
    expect(Scope.read.name, 'read');
    expect(Scope.write.name, 'write');
    expect(Scope.follow.name, 'follow');
  });

  test('.value', () {
    expect(Scope.read.value, 'read');
    expect(Scope.write.value, 'write');
    expect(Scope.follow.value, 'follow');
  });
}
