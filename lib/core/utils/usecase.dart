import 'package:Test01/core/utils/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Result, Request> {
  Future<Either<AppError, Result>> call(Request request);
}
