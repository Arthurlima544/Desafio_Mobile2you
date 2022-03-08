import 'package:app_movie/core/error/Failures.dart/failure.dart';
import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, Movie>> getmovieDetails(int id);
}
