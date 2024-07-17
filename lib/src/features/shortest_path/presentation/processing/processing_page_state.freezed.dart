// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processing_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProcessingPageState {
  List<Task> get tasks => throw _privateConstructorUsedError;
  List<Result> get results => throw _privateConstructorUsedError;
  bool get isLoadingTasks => throw _privateConstructorUsedError;
  bool get isCheckingTasks => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProcessingPageStateCopyWith<ProcessingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessingPageStateCopyWith<$Res> {
  factory $ProcessingPageStateCopyWith(
          ProcessingPageState value, $Res Function(ProcessingPageState) then) =
      _$ProcessingPageStateCopyWithImpl<$Res, ProcessingPageState>;
  @useResult
  $Res call(
      {List<Task> tasks,
      List<Result> results,
      bool isLoadingTasks,
      bool isCheckingTasks,
      String? errorMessage});
}

/// @nodoc
class _$ProcessingPageStateCopyWithImpl<$Res, $Val extends ProcessingPageState>
    implements $ProcessingPageStateCopyWith<$Res> {
  _$ProcessingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? results = null,
    Object? isLoadingTasks = null,
    Object? isCheckingTasks = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
      isLoadingTasks: null == isLoadingTasks
          ? _value.isLoadingTasks
          : isLoadingTasks // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingTasks: null == isCheckingTasks
          ? _value.isCheckingTasks
          : isCheckingTasks // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessingPageStateImplCopyWith<$Res>
    implements $ProcessingPageStateCopyWith<$Res> {
  factory _$$ProcessingPageStateImplCopyWith(_$ProcessingPageStateImpl value,
          $Res Function(_$ProcessingPageStateImpl) then) =
      __$$ProcessingPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Task> tasks,
      List<Result> results,
      bool isLoadingTasks,
      bool isCheckingTasks,
      String? errorMessage});
}

/// @nodoc
class __$$ProcessingPageStateImplCopyWithImpl<$Res>
    extends _$ProcessingPageStateCopyWithImpl<$Res, _$ProcessingPageStateImpl>
    implements _$$ProcessingPageStateImplCopyWith<$Res> {
  __$$ProcessingPageStateImplCopyWithImpl(_$ProcessingPageStateImpl _value,
      $Res Function(_$ProcessingPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? results = null,
    Object? isLoadingTasks = null,
    Object? isCheckingTasks = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ProcessingPageStateImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
      isLoadingTasks: null == isLoadingTasks
          ? _value.isLoadingTasks
          : isLoadingTasks // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingTasks: null == isCheckingTasks
          ? _value.isCheckingTasks
          : isCheckingTasks // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProcessingPageStateImpl extends _ProcessingPageState {
  const _$ProcessingPageStateImpl(
      {final List<Task> tasks = const [],
      final List<Result> results = const [],
      this.isLoadingTasks = true,
      this.isCheckingTasks = false,
      this.errorMessage})
      : _tasks = tasks,
        _results = results,
        super._();

  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<Result> _results;
  @override
  @JsonKey()
  List<Result> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final bool isLoadingTasks;
  @override
  @JsonKey()
  final bool isCheckingTasks;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ProcessingPageState(tasks: $tasks, results: $results, isLoadingTasks: $isLoadingTasks, isCheckingTasks: $isCheckingTasks, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessingPageStateImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.isLoadingTasks, isLoadingTasks) ||
                other.isLoadingTasks == isLoadingTasks) &&
            (identical(other.isCheckingTasks, isCheckingTasks) ||
                other.isCheckingTasks == isCheckingTasks) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_results),
      isLoadingTasks,
      isCheckingTasks,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessingPageStateImplCopyWith<_$ProcessingPageStateImpl> get copyWith =>
      __$$ProcessingPageStateImplCopyWithImpl<_$ProcessingPageStateImpl>(
          this, _$identity);
}

abstract class _ProcessingPageState extends ProcessingPageState {
  const factory _ProcessingPageState(
      {final List<Task> tasks,
      final List<Result> results,
      final bool isLoadingTasks,
      final bool isCheckingTasks,
      final String? errorMessage}) = _$ProcessingPageStateImpl;
  const _ProcessingPageState._() : super._();

  @override
  List<Task> get tasks;
  @override
  List<Result> get results;
  @override
  bool get isLoadingTasks;
  @override
  bool get isCheckingTasks;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ProcessingPageStateImplCopyWith<_$ProcessingPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
