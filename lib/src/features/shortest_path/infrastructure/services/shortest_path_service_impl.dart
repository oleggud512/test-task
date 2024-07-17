import 'package:injectable/injectable.dart';
import 'package:shortest_path/bredth_first_serach.dart';
import 'package:test_task/src/core/common/constants/strings.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/point.dart';
import 'package:test_task/src/features/shortest_path/external/services/shortest_path.dart';

@Singleton(as: ShortestPathService)
class ShortestPathServiceImpl implements ShortestPathService {
  @override
  List<Point> findShortestPath(Point start, Point end, List<String> field) {
    final graph = <Point, List<Point>>{};

    final w = field[0].length;
    final h = field.length;

    final deltas = [
      (-1, -1), (-1,  0), (-1,  1),
      ( 0, -1),           ( 0,  1),
      ( 1, -1), ( 1,  0), ( 1,  1),
    ];

    for (var r = 0; r < h; r++) {
      for (var c = 0; c < w; c++) {
        if (field[r][c] == fieldObstacle) continue;
        
        final point = Point(x: c, y: r);
        // print("point $point");
        graph[point] = [];

        for (var (dr, dc) in deltas) {
          final rr = r + dr;
          final cc = c + dc;
          // print("ngb rr=$rr cc=$cc");
          
          // check basic field cnsotraints
          if (rr < 0 || rr >= h) continue;
          if (cc < 0 || cc >= w) continue;

          // check obstacles
          if (field[rr][cc] == fieldObstacle) continue;
          // print("br");

          graph[point]!.add(Point(x: cc, y: rr));
        }
      }
    }
    // print("w=$w h=$h ${graph}");

    final bfs = BredthFirstSearch<Point>(start, end, graph);
    return bfs.getShortestPath();
  }

}