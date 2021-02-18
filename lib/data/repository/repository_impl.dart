import 'package:Test01/core/utils/app_error.dart';
import 'package:Test01/domain/data_source/remote_data_source.dart';
import 'package:Test01/domain/entity/repos_entity.dart';
import 'package:Test01/domain/entity/user_entity.dart';
import 'package:Test01/domain/entity/search_entity.dart';
import 'package:Test01/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {

  RemoteDataSource remoteDataSource;
  
  RepositoryImpl({this.remoteDataSource});
  @override
  Future<Either<AppError, List<SearchEnity>>> searchUser(String userName) async {
    try {
      return right(await remoteDataSource.getUsers(userName));
    } catch (e) {
      return left(AppError(errorMessage: e));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> userInfo(String userName) async {
    try {
      return right(await remoteDataSource.getUser(userName));
    } catch (e) {
      return left(AppError(errorMessage: e));
    }
  }

  @override
  Future<Either<AppError, List<ReposEntity>>> userRepos(String userName) async {
    try {
      return right(await remoteDataSource.getUserRepos(userName));
    } catch (e) {
      return left(AppError(errorMessage: e));
    }
  }
}
