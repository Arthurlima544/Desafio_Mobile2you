import 'package:app_movie/core/error/Exceptions/ServerException.dart';
import 'package:app_movie/core/error/Failures.dart/ServerFailure.dart';
import 'package:app_movie/core/error/Failures.dart/failure.dart';
import 'package:app_movie/features/data/datasource/MovieRemoteDataSource.dart';
import 'package:app_movie/features/domain/entities/movie.dart';

import 'package:app_movie/features/domain/repository/MovieDetailsRepository.dart';
import 'package:dartz/dartz.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieDetailsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Movie>> getmovieDetails(int id) async {
    try {
      final remoteMovie = await remoteDataSource.getmovieDetails(id);
      return Right(remoteMovie);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
