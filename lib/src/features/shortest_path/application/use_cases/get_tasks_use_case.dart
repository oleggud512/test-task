import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/src/core/domain/exceptions.dart';
import 'package:test_task/src/features/shortest_path/data/task_data_source.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/task.dart';


@Injectable()
class GetTasksUseCase {
  final TaskDataSource source;

  GetTasksUseCase(this.source);
  
  Future<Either<AppException, List<Task>>> call(Dio dio) async {
    final res = source.getTasks(dio);
    return res;
  }
}