// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function() noPic,
    required TResult Function(Permission permission) permission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function()? noPic,
    TResult? Function(Permission permission)? permission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function()? noPic,
    TResult Function(Permission permission)? permission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppGeneralException value) general,
    required TResult Function(NoPictureException value) noPic,
    required TResult Function(PermissionFailure value) permission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppGeneralException value)? general,
    TResult? Function(NoPictureException value)? noPic,
    TResult? Function(PermissionFailure value)? permission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppGeneralException value)? general,
    TResult Function(NoPictureException value)? noPic,
    TResult Function(PermissionFailure value)? permission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppGeneralExceptionCopyWith<$Res> {
  factory _$$AppGeneralExceptionCopyWith(_$AppGeneralException value,
          $Res Function(_$AppGeneralException) then) =
      __$$AppGeneralExceptionCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AppGeneralExceptionCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$AppGeneralException>
    implements _$$AppGeneralExceptionCopyWith<$Res> {
  __$$AppGeneralExceptionCopyWithImpl(
      _$AppGeneralException _value, $Res Function(_$AppGeneralException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AppGeneralException(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppGeneralException implements AppGeneralException {
  const _$AppGeneralException(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppException.general(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppGeneralException &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppGeneralExceptionCopyWith<_$AppGeneralException> get copyWith =>
      __$$AppGeneralExceptionCopyWithImpl<_$AppGeneralException>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function() noPic,
    required TResult Function(Permission permission) permission,
  }) {
    return general(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function()? noPic,
    TResult? Function(Permission permission)? permission,
  }) {
    return general?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function()? noPic,
    TResult Function(Permission permission)? permission,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppGeneralException value) general,
    required TResult Function(NoPictureException value) noPic,
    required TResult Function(PermissionFailure value) permission,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppGeneralException value)? general,
    TResult? Function(NoPictureException value)? noPic,
    TResult? Function(PermissionFailure value)? permission,
  }) {
    return general?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppGeneralException value)? general,
    TResult Function(NoPictureException value)? noPic,
    TResult Function(PermissionFailure value)? permission,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class AppGeneralException implements AppException {
  const factory AppGeneralException(final String message) =
      _$AppGeneralException;

  String get message;
  @JsonKey(ignore: true)
  _$$AppGeneralExceptionCopyWith<_$AppGeneralException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoPictureExceptionCopyWith<$Res> {
  factory _$$NoPictureExceptionCopyWith(_$NoPictureException value,
          $Res Function(_$NoPictureException) then) =
      __$$NoPictureExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoPictureExceptionCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NoPictureException>
    implements _$$NoPictureExceptionCopyWith<$Res> {
  __$$NoPictureExceptionCopyWithImpl(
      _$NoPictureException _value, $Res Function(_$NoPictureException) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoPictureException implements NoPictureException {
  const _$NoPictureException();

  @override
  String toString() {
    return 'AppException.noPic()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoPictureException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function() noPic,
    required TResult Function(Permission permission) permission,
  }) {
    return noPic();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function()? noPic,
    TResult? Function(Permission permission)? permission,
  }) {
    return noPic?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function()? noPic,
    TResult Function(Permission permission)? permission,
    required TResult orElse(),
  }) {
    if (noPic != null) {
      return noPic();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppGeneralException value) general,
    required TResult Function(NoPictureException value) noPic,
    required TResult Function(PermissionFailure value) permission,
  }) {
    return noPic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppGeneralException value)? general,
    TResult? Function(NoPictureException value)? noPic,
    TResult? Function(PermissionFailure value)? permission,
  }) {
    return noPic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppGeneralException value)? general,
    TResult Function(NoPictureException value)? noPic,
    TResult Function(PermissionFailure value)? permission,
    required TResult orElse(),
  }) {
    if (noPic != null) {
      return noPic(this);
    }
    return orElse();
  }
}

abstract class NoPictureException implements AppException {
  const factory NoPictureException() = _$NoPictureException;
}

/// @nodoc
abstract class _$$PermissionFailureCopyWith<$Res> {
  factory _$$PermissionFailureCopyWith(
          _$PermissionFailure value, $Res Function(_$PermissionFailure) then) =
      __$$PermissionFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Permission permission});
}

/// @nodoc
class __$$PermissionFailureCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$PermissionFailure>
    implements _$$PermissionFailureCopyWith<$Res> {
  __$$PermissionFailureCopyWithImpl(
      _$PermissionFailure _value, $Res Function(_$PermissionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = null,
  }) {
    return _then(_$PermissionFailure(
      null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as Permission,
    ));
  }
}

/// @nodoc

class _$PermissionFailure implements PermissionFailure {
  const _$PermissionFailure(this.permission);

  @override
  final Permission permission;

  @override
  String toString() {
    return 'AppException.permission(permission: $permission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionFailure &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionFailureCopyWith<_$PermissionFailure> get copyWith =>
      __$$PermissionFailureCopyWithImpl<_$PermissionFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function() noPic,
    required TResult Function(Permission permission) permission,
  }) {
    return permission(this.permission);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function()? noPic,
    TResult? Function(Permission permission)? permission,
  }) {
    return permission?.call(this.permission);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function()? noPic,
    TResult Function(Permission permission)? permission,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(this.permission);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppGeneralException value) general,
    required TResult Function(NoPictureException value) noPic,
    required TResult Function(PermissionFailure value) permission,
  }) {
    return permission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppGeneralException value)? general,
    TResult? Function(NoPictureException value)? noPic,
    TResult? Function(PermissionFailure value)? permission,
  }) {
    return permission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppGeneralException value)? general,
    TResult Function(NoPictureException value)? noPic,
    TResult Function(PermissionFailure value)? permission,
    required TResult orElse(),
  }) {
    if (permission != null) {
      return permission(this);
    }
    return orElse();
  }
}

abstract class PermissionFailure implements AppException {
  const factory PermissionFailure(final Permission permission) =
      _$PermissionFailure;

  Permission get permission;
  @JsonKey(ignore: true)
  _$$PermissionFailureCopyWith<_$PermissionFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
