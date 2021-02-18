import 'package:Test01/core/utils/app_error.dart';
import 'package:Test01/domain/entity/repos_entity.dart';
import 'package:Test01/domain/entity/search_entity.dart';
import 'package:Test01/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<AppError, List<SearchEnity>>> searchUser(String userName);
  Future<Either<AppError, UserEntity>> userInfo(String userName);
  Future<Either<AppError, List<ReposEntity>>> userRepos(String userName);
}
