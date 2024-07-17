import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/src/core/common/constants/strings.dart';


@Injectable()
class GetUrlUseCase {
  
  Future<String?> call() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(urlPrefsKey);
  }
}