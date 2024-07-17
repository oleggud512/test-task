import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';

part 'processing_page_event.freezed.dart';

@freezed
class ProcessingPageEvent with _$ProcessingPageEvent {
  factory ProcessingPageEvent() = _ProcessingPageEvent;

  factory ProcessingPageEvent.init() = ProcessingPageInitEvent;
  factory ProcessingPageEvent.checkResults({
    required void Function(List<Result> results) onSuccess,
    required void Function(String message) onError
  }) = ProcessingPageCheckResultsEvent;
}