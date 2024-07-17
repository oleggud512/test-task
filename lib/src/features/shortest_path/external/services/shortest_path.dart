import 'package:test_task/src/features/shortest_path/domain/entities/point.dart';

abstract interface class ShortestPathService {
  List<Point> findShortestPath(Point start, Point end, List<String> field);
}