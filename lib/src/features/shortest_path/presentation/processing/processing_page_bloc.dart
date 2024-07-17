import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/src/core/common/logger.dart';
import 'package:test_task/src/core/di/inject.dart';
import 'package:test_task/src/features/shortest_path/application/use_cases/check_results_use_case.dart';
import 'package:test_task/src/features/shortest_path/application/use_cases/get_shortest_path_use_case.dart';
import 'package:test_task/src/features/shortest_path/application/use_cases/get_tasks_use_case.dart';
import 'package:test_task/src/features/shortest_path/application/use_cases/get_url_use_case.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page_event.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page_state.dart';

@injectable
class ProcessingPageBloc extends Bloc<ProcessingPageEvent, ProcessingPageState> {
  final getUrl = inject<GetUrlUseCase>();
  final getTasks = inject<GetTasksUseCase>();
  final getShortestPath = inject<GetShortestPathUseCase>();
  final checkResults = inject<CheckResultsUseCase>();

  late final Dio dio;

  ProcessingPageBloc() : super(const ProcessingPageState()) {
    on<ProcessingPageInitEvent>(_init);
    on<ProcessingPageCheckResultsEvent>(_checkResults);
  }

  Future<void> _init(
    ProcessingPageInitEvent event, 
    Emitter<ProcessingPageState> emit
  ) async {
    emit(state.copyWith(isLoadingTasks: true));

    final url = await getUrl();
    dio = Dio(BaseOptions(baseUrl: url!));
    final tasks = await getTasks(dio);
    glogger.i(url);
    final results = tasks.map((right) {
      return right.map((task) => Result(
        id: task.id,
        steps: getShortestPath(task.start, task.end, task.field)
      )).toList();
    });
    results.fold(
      (left) {
        emit(state.copyWith(
          errorMessage: left.message,
          isLoadingTasks: false
        ));
      },
      (right) {
        emit(state.copyWith(
          results: right,
          isLoadingTasks: false
        ));
      }
    );
  }

  Future<void> _checkResults(
    ProcessingPageCheckResultsEvent event, 
    Emitter<ProcessingPageState> emit
  ) async {
    emit(state.copyWith(
      isCheckingTasks: true
    ));

    final res = await checkResults(dio, state.results);

    res.fold(
      (left) {
        emit(state.copyWith(isCheckingTasks: false));
        event.onError(left.message);
      },
      (right) {
        emit(state.copyWith(
          results: right,
          isCheckingTasks: false
        ));
        event.onSuccess(right);
      }
    );
  }
}