import 'package:app_movie/core/error/failure.dart';
import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/features/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetails extends UseCase<Movie, Parameters> {
  @override
  Future<Either<Failure, Movie>> call(Parameters params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
