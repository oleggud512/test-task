import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/src/core/domain/exceptions.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/point.dart';
import 'package:test_task/src/features/shortest_path/external/services/shortest_path.dart';


@Injectable()
class GetShortestPathUseCase {
  final ShortestPathService serv;

  GetShortestPathUseCase(this.serv);
  
  Either<AppException, List<Point>> call(Point start, Point end, List<String> field) {
    try {
      return Right(serv.findShortestPath(start, end, field));
    } on AppException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(AppException(e.toString()));
    }
  }
}