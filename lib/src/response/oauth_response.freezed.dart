// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'oauth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OAuthResponse _$OAuthResponseFromJson(Map<String, dynamic> json) {
  return _OAuthResponse.fromJson(json);
}

/// @nodoc
mixin _$OAuthResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'scope')
  @ScopeConverter()
  List<Scope> get scopes => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OAuthResponseCopyWith<OAuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OAuthResponseCopyWith<$Res> {
  factory $OAuthResponseCopyWith(
          OAuthResponse value, $Res Function(OAuthResponse) then) =
      _$OAuthResponseCopyWithImpl<$Res, OAuthResponse>;
  @useResult
  $Res call(
      {String accessToken,
      String tokenType,
      @JsonKey(name: 'scope') @ScopeConverter() List<Scope> scopes,
      @DateTimeConverter() DateTime createdAt});
}

/// @nodoc
class _$OAuthResponseCopyWithImpl<$Res, $Val extends OAuthResponse>
    implements $OAuthResponseCopyWith<$Res> {
  _$OAuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? scopes = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      scopes: null == scopes
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as List<Scope>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OAuthResponseCopyWith<$Res>
    implements $OAuthResponseCopyWith<$Res> {
  factory _$$_OAuthResponseCopyWith(
          _$_OAuthResponse value, $Res Function(_$_OAuthResponse) then) =
      __$$_OAuthResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String tokenType,
      @JsonKey(name: 'scope') @ScopeConverter() List<Scope> scopes,
      @DateTimeConverter() DateTime createdAt});
}

/// @nodoc
class __$$_OAuthResponseCopyWithImpl<$Res>
    extends _$OAuthResponseCopyWithImpl<$Res, _$_OAuthResponse>
    implements _$$_OAuthResponseCopyWith<$Res> {
  __$$_OAuthResponseCopyWithImpl(
      _$_OAuthResponse _value, $Res Function(_$_OAuthResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? scopes = null,
    Object? createdAt = null,
  }) {
    return _then(_$_OAuthResponse(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      scopes: null == scopes
          ? _value._scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as List<Scope>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OAuthResponse implements _OAuthResponse {
  const _$_OAuthResponse(
      {required this.accessToken,
      required this.tokenType,
      @JsonKey(name: 'scope')
      @ScopeConverter()
          required final List<Scope> scopes,
      @DateTimeConverter()
          required this.createdAt})
      : _scopes = scopes;

  factory _$_OAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OAuthResponseFromJson(json);

  @override
  final String accessToken;
  @override
  final String tokenType;
  final List<Scope> _scopes;
  @override
  @JsonKey(name: 'scope')
  @ScopeConverter()
  List<Scope> get scopes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scopes);
  }

  @override
  @DateTimeConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'OAuthResponse(accessToken: $accessToken, tokenType: $tokenType, scopes: $scopes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OAuthResponse &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            const DeepCollectionEquality().equals(other._scopes, _scopes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, tokenType,
      const DeepCollectionEquality().hash(_scopes), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OAuthResponseCopyWith<_$_OAuthResponse> get copyWith =>
      __$$_OAuthResponseCopyWithImpl<_$_OAuthResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OAuthResponseToJson(
      this,
    );
  }
}

abstract class _OAuthResponse implements OAuthResponse {
  const factory _OAuthResponse(
      {required final String accessToken,
      required final String tokenType,
      @JsonKey(name: 'scope')
      @ScopeConverter()
          required final List<Scope> scopes,
      @DateTimeConverter()
          required final DateTime createdAt}) = _$_OAuthResponse;

  factory _OAuthResponse.fromJson(Map<String, dynamic> json) =
      _$_OAuthResponse.fromJson;

  @override
  String get accessToken;
  @override
  String get tokenType;
  @override
  @JsonKey(name: 'scope')
  @ScopeConverter()
  List<Scope> get scopes;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_OAuthResponseCopyWith<_$_OAuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
