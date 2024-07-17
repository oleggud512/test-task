import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/src/core/domain/exceptions.dart';
import 'package:test_task/src/features/shortest_path/data/task_data_source.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';


@Injectable()
class CheckResultsUseCase {
  final TaskDataSource source;

  CheckResultsUseCase(this.source);
  
  Future<Either<AppException, List<Result>>> call(Dio dio, List<Result> results) async {
    final res = await source.checkTasks(dio, results);
    return res;
  }
}