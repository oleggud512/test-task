import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/point.dart';

part 'result.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class Result with _$Result {
  const Result._();

  const factory Result({
    @Default("") String id,
    @Default([]) List<Point> steps,
    @Default(false) bool isChecked,
    @Default(false) bool isCorrect
  }) = _Result;

  String get path => steps.map((s) => "(${s.x},${s.y})").join("->");

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "result": {
        "steps": steps.map((s) => s.toJson()).toList(),
        "path": path
      }
    };
  }

}