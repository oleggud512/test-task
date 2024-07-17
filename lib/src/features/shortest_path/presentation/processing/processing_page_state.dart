import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/task.dart';

part 'processing_page_state.freezed.dart';

@freezed
class ProcessingPageState with _$ProcessingPageState {
  const ProcessingPageState._(); 

  const factory ProcessingPageState({
    @Default([]) List<Task> tasks,
    @Default([]) List<Result> results,
    @Default(true) bool isLoadingTasks,
    @Default(false) bool isCheckingTasks,
    String? errorMessage
  }) = _ProcessingPageState;

  bool get canSave => errorMessage == null && !isLoadingTasks && !isCheckingTasks;

  bool get tasksLoaded => errorMessage == null && !isLoadingTasks;

}