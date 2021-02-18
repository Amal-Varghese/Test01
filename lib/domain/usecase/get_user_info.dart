import 'package:Test01/core/utils/app_error.dart';
import 'package:Test01/core/utils/usecase.dart';
import 'package:Test01/domain/entity/user_entity.dart';
import 'package:Test01/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetUserInfo extends UseCase<UserEntity, String> {
  Repository repository;
  GetUserInfo({this.repository});
  @override
  Future<Either<AppError, UserEntity>> call(String request) async {
    return await repository.userInfo(request);
  }
}
