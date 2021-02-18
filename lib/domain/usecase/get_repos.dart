import 'package:Test01/core/utils/app_error.dart';
import 'package:Test01/core/utils/usecase.dart';
import 'package:Test01/domain/entity/repos_entity.dart';
import 'package:Test01/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetRepos extends UseCase<List<ReposEntity>, String> {
  Repository repository;
  GetRepos({this.repository});
  @override
  Future<Either<AppError, List<ReposEntity>>> call(String request) async {
    return await repository.userRepos(request);
  }
}
