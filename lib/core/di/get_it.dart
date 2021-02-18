import 'package:Test01/core/api/api_endpoints.dart';
import 'package:Test01/data/data_source/remote_data_source_impl.dart';
import 'package:Test01/data/repository/repository_impl.dart';
import 'package:Test01/domain/data_source/remote_data_source.dart';
import 'package:Test01/domain/repository/repository.dart';
import 'package:Test01/domain/usecase/get_repos.dart';
import 'package:Test01/domain/usecase/get_user_info.dart';
import 'package:Test01/domain/usecase/get_users.dart';
import 'package:Test01/presentation/bloc/repos/repos.dart';
import 'package:Test01/presentation/bloc/search/search_bloc.dart';
import 'package:Test01/presentation/bloc/user/user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> init() async {
  getit.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 50000,
      receiveTimeout: 50000,
    )),
  );

  getit.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(dio: getit<Dio>()));

  getit.registerLazySingleton<Repository>(
      () => RepositoryImpl(remoteDataSource: getit<RemoteDataSource>()));

  getit.registerLazySingleton<GetRepos>(
      () => GetRepos(repository: getit<Repository>()));

  getit.registerLazySingleton<GetUserInfo>(
      () => GetUserInfo(repository: getit<Repository>()));

  getit.registerLazySingleton<GetUsers>(
      () => GetUsers(repository: getit<Repository>()));

  getit
      .registerFactory<ReposBloc>(() => ReposBloc(getRepos: getit<GetRepos>()));

  getit.registerFactory<UserBloc>(
      () => UserBloc(getUserInfo: getit<GetUserInfo>()));

  getit.registerFactory<SearchBloc>(
      () => SearchBloc(getUsers: getit<GetUsers>()));
}
