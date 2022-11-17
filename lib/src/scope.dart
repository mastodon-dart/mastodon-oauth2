// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

enum Scope {
  /// Allows read access to all data in account.
  read('read'),

  /// Allows changes to all data in account.
  write('write'),

  /// Allows changes to account connections.
  follow('follow');

  /// The scope value
  final String value;

  const Scope(this.value);

  /// Returns the scope associated with the given [value].
  static Scope valueOf(final String value) {
    for (final scope in values) {
      if (scope.value == value) {
        return scope;
      }
    }

    throw ArgumentError('Invalid scope value: $value');
  }
}
