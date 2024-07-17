import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:test_task/src/core/domain/exceptions.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/task.dart';

abstract interface class TaskDataSource {
  Future<Either<AppException, List<Task>>> getTasks(Dio dio);
  Future<Either<AppException, List<Result>>> checkTasks(Dio dio, List<Result> results); 
}