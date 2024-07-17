import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/src/core/common/logger.dart';
import 'package:test_task/src/core/domain/exceptions.dart';
import 'package:test_task/src/features/shortest_path/data/task_data_source.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/task.dart';

@Singleton(as: TaskDataSource)
class TaskDataSourseImpl implements TaskDataSource {
  static const data = "data";
  static const error = "error";
  static const message = "message";

  @override
  Future<Either<AppException, List<Result>>> checkTasks(Dio dio, List<Result> results) async {
    try {
      final response = await dio.post("", 
        data: results.map((r) => r.toJson()).toList()
      );

      final res = [...results];

      for (Map<String, dynamic> resData in response.data[data]!) {
        var { 
          "id": String id, 
          "correct": bool correct
        } = resData;
        
        final i = results.indexWhere((r) => r.id == id);
        res[i] = res[i].copyWith(
          isChecked: true,
          isCorrect: correct
        );
      }
      return Right(res);
    } on DioException catch (e, st) {
      glogger.e(e, stackTrace: st);
      return Left(AppException(e.response?.data[data][message] ?? "No message provided"));
    } catch (e, st) {
      glogger.e(e, stackTrace: st);
      return Left(AppException(e.toString()));
    }
  }

  @override
  Future<Either<AppException, List<Task>>> getTasks(Dio dio) async {
    try {
      final res = await dio.get("");
      final tasks = List.from(res.data[data]).map((t) => Task.fromJson(t)).toList();
      return Right(tasks);
    } on DioException catch (e, st) {
      glogger.e(e, stackTrace: st);
      return Left(AppException(e.response?.data[message] ?? "No responce"));
    } catch (e, st) {
      glogger.e(e, stackTrace: st);
      return Left(AppException(e.toString()));
    }
  }
  
}