import 'package:injectable/injectable.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:test_task/src/core/common/constants/strings.dart';

@Injectable()
class SaveUrlUseCase {
  
  Future<void> call(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(urlPrefsKey, url);
  }
}