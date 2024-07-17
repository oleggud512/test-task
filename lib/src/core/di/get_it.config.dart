// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_task/src/core/di/get_it.dart' as _i14;
import 'package:test_task/src/features/shortest_path/application/use_cases/check_results_use_case.dart'
    as _i12;
import 'package:test_task/src/features/shortest_path/application/use_cases/get_shortest_path_use_case.dart'
    as _i10;
import 'package:test_task/src/features/shortest_path/application/use_cases/get_tasks_use_case.dart'
    as _i11;
import 'package:test_task/src/features/shortest_path/application/use_cases/get_url_use_case.dart'
    as _i3;
import 'package:test_task/src/features/shortest_path/application/use_cases/save_url_use_case.dart'
    as _i4;
import 'package:test_task/src/features/shortest_path/data/task_data_source.dart'
    as _i8;
import 'package:test_task/src/features/shortest_path/external/services/shortest_path.dart'
    as _i6;
import 'package:test_task/src/features/shortest_path/infrastructure/data_sources/task_data_sourse_impl.dart'
    as _i9;
import 'package:test_task/src/features/shortest_path/infrastructure/services/shortest_path_service_impl.dart'
    as _i7;
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page_bloc.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.GetUrlUseCase>(() => _i3.GetUrlUseCase());
    gh.factory<_i4.SaveUrlUseCase>(() => _i4.SaveUrlUseCase());
    gh.factory<_i5.ProcessingPageBloc>(() => _i5.ProcessingPageBloc());
    gh.singleton<_i6.ShortestPathService>(() => _i7.ShortestPathServiceImpl());
    gh.singleton<_i8.TaskDataSource>(() => _i9.TaskDataSourseImpl());
    gh.factory<_i10.GetShortestPathUseCase>(
        () => _i10.GetShortestPathUseCase(gh<_i6.ShortestPathService>()));
    gh.factory<_i11.GetTasksUseCase>(
        () => _i11.GetTasksUseCase(gh<_i8.TaskDataSource>()));
    gh.factory<_i12.CheckResultsUseCase>(
        () => _i12.CheckResultsUseCase(gh<_i8.TaskDataSource>()));
    gh.factory<_i13.Dio>(() => registerModule.getDio(gh<String>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
