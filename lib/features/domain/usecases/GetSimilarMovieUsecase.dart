import 'package:app_movie/core/error/Failures.dart/failure.dart';
import 'package:app_movie/core/utils/SimilarParameters.dart';
import 'package:app_movie/features/domain/entities/SimilarMovies.dart';
import 'package:app_movie/features/domain/repository/SimilarMovieRepository.dart';
import 'package:app_movie/features/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSimilarMovies extends UseCase<SimilarMovies, SimilarMovieParameters> {
  final SimilarMovieRepository repository;
  GetSimilarMovies(this.repository);

  @override
  Future<Either<Failure, SimilarMovies>> call(
      SimilarMovieParameters params) async {
    return repository.getSimilarMovies(params.id, params.page);
  }
}
