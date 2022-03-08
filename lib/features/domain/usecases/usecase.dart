import 'package:app_movie/core/error/Failures.dart/failure.dart';

import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
