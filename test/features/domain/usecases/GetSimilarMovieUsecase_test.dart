import 'package:app_movie/core/utils/SimilarParameters.dart';
import 'package:app_movie/features/domain/entities/SimilarMovies.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/features/domain/repository/SimilarMovieRepository.dart';
import 'package:app_movie/features/domain/usecases/GetSimilarMovieUsecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'GetSimilarMovieUsecase_test.mocks.dart';

@GenerateMocks([SimilarMovieRepository])
void main() {
  final movie = Movie(
      title: "MovieTest",
      id: 505,
      likes: 55,
      popularity: 55.2,
      posterPath: '\test.jpg');
  final SimilarMovies similarMovies =
      SimilarMovies(similarMovies: <Movie>[movie]);
  final params = SimilarMovieParameters(id: 505, page: 1);
  test('Deve retornar um objeto do tipo SimilarMovies ao chamar um usecase',
      () async {
    final repo = MockSimilarMovieRepository();
    final usecase = GetSimilarMovies(repo);

    when(repo.getSimilarMovies(params.id, params.page))
        .thenAnswer((realInvocation) async => Right(similarMovies));

    final result = await usecase(params);

    expect(result, Right(similarMovies));
  });
}
