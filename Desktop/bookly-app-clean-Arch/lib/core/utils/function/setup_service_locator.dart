import 'package:bookly_app_clean/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_clean/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_clean/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_clean/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app_clean/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app_clean/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
