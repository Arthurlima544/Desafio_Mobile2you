import 'package:app_movie/features/data/datasource/SimilarMovieDataSource.dart';
import 'package:app_movie/features/data/datasource/SimilarMovieDataSourceImpl.dart';
import 'package:app_movie/features/domain/entities/SimilarMovies.dart';
import 'package:app_movie/core/error/Failures.dart/failure.dart';
import 'package:app_movie/features/domain/repository/SimilarMovieRepository.dart';
import 'package:dartz/dartz.dart';

class SimilarMovieRepositoryImpl implements SimilarMovieRepository {
  final SimilarMovieDataSource dataSource;

  SimilarMovieRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, SimilarMovies>> getSimilarMovies(
      int id, int page) async {
    final remoteSimilarMovie = await dataSource.getSimilarMovies(id, page);
    return Right(remoteSimilarMovie);
  }
}
