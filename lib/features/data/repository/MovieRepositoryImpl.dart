import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/core/error/failure.dart';
import 'package:app_movie/features/domain/repository/MovieDetailsRepository.dart';
import 'package:dartz/dartz.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  @override
  Future<Either<Failure, Movie>> getmovieDetails(int id) {
    // TODO: implement getmovieDetails
    throw UnimplementedError();
  }
}
