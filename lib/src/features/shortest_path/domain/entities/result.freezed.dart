// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Result {
  String get id => throw _privateConstructorUsedError;
  List<Point> get steps => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call({String id, List<Point> steps, bool isChecked, bool isCorrect});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? steps = null,
    Object? isChecked = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl value, $Res Function(_$ResultImpl) then) =
      __$$ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<Point> steps, bool isChecked, bool isCorrect});
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl _value, $Res Function(_$ResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? steps = null,
    Object? isChecked = null,
    Object? isCorrect = null,
  }) {
    return _then(_$ResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ResultImpl extends _Result {
  const _$ResultImpl(
      {this.id = "",
      final List<Point> steps = const [],
      this.isChecked = false,
      this.isCorrect = false})
      : _steps = steps,
        super._();

  @override
  @JsonKey()
  final String id;
  final List<Point> _steps;
  @override
  @JsonKey()
  List<Point> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  @JsonKey()
  final bool isChecked;
  @override
  @JsonKey()
  final bool isCorrect;

  @override
  String toString() {
    return 'Result(id: $id, steps: $steps, isChecked: $isChecked, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_steps), isChecked, isCorrect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);
}

abstract class _Result extends Result {
  const factory _Result(
      {final String id,
      final List<Point> steps,
      final bool isChecked,
      final bool isCorrect}) = _$ResultImpl;
  const _Result._() : super._();

  @override
  String get id;
  @override
  List<Point> get steps;
  @override
  bool get isChecked;
  @override
  bool get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
