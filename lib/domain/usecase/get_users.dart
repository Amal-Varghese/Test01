import 'package:Test01/core/utils/app_error.dart';
import 'package:Test01/core/utils/usecase.dart';
import 'package:Test01/domain/entity/search_entity.dart';
import 'package:Test01/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetUsers extends UseCase<List<SearchEnity>, String> {
  Repository repository;
  GetUsers({this.repository});
  @override
  Future<Either<AppError, List<SearchEnity>>> call(String request) async {
    return await repository.searchUser(request);
  }
}
