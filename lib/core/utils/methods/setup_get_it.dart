import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/data_sources/local_data_source/home_local_data_source_implement.dart';
import '../../../features/home/data/data_sources/remote_data_source/home_remote_data_source_implementation.dart';
import '../../../features/home/data/repos/home_repo_implement.dart';
import '../api_services.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton<ApiServices>(ApiServices(Dio()));
  locator.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      homeRemoteDataSource: HomeRemoteDataSourceImplementation(
        apiServices: locator.get<ApiServices>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImplementation(),
    ),
  );
}
