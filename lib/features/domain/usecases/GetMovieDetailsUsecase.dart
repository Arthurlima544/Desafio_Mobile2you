import 'package:app_movie/core/error/Failures.dart/failure.dart';

import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/features/domain/repository/MovieDetailsRepository.dart';
import 'package:app_movie/features/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetails extends UseCase<Movie, Parameters> {
  final MovieDetailsRepository repository;

  GetMovieDetails(this.repository);
  @override
  Future<Either<Failure, Movie>> call(Parameters params) async {
    return await repository.getmovieDetails(params.id);
  }
}
