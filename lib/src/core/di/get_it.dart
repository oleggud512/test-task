import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'get_it.config.dart';


@module
abstract class RegisterModule {

  @injectable
  Dio getDio(String baseUrl) => Dio(BaseOptions(
    baseUrl: baseUrl,
  ));

}

@InjectableInit()
GetIt configureDependencies() => GetIt.instance.init();