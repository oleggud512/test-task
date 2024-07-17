import 'package:injectable/injectable.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/point.dart';
import 'package:test_task/src/features/shortest_path/external/services/shortest_path.dart';


@Injectable()
class GetShortestPathUseCase {
  final ShortestPathService serv;

  GetShortestPathUseCase(this.serv);
  
  List<Point> call(Point start, Point end, List<String> field) {
    return serv.findShortestPath(start, end, field);
  }
}