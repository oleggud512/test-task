import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/point.dart';

part "task.freezed.dart";
part "task.g.dart";

@freezed
class Task with _$Task {
  factory Task({
    required String id,
    required List<String> field,
    required Point start,
    required Point end,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}