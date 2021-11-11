import 'package:app_movie/core/error/Failures.dart/failure.dart';
import 'package:app_movie/features/domain/entities/SimilarMovies.dart';
import 'package:dartz/dartz.dart';

abstract class SimilarMovieRepository {
  Future<Either<Failure, SimilarMovies>> getSimilarMovies(int id, int page);
}
