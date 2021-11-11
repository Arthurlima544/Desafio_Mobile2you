import 'package:app_movie/core/utils/SimilarParameters.dart';
import 'package:app_movie/features/data/datasource/SimilarMovieDataSourceImpl.dart';
import 'package:app_movie/features/data/models/movieModel.dart';
import 'package:app_movie/features/data/models/similarMoviesModel.dart';
import 'package:app_movie/features/data/repository/SimilarMovieRepositoryImpl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'SimilarMovieRepositoryImpl_test.mocks.dart';

@GenerateMocks([SimilarMovieDataSourceImpl])
void main() {
  final params = SimilarMovieParameters(id: 550, page: 1);
  late MockSimilarMovieDataSourceImpl mockDataSource;
  late SimilarMovieRepositoryImpl repositoryImpl;
  final movieModel1 = MovieModel(
    title: "The 13th Warrior",
    likes: 1350,
    popularity: 21.949,
    id: 1911,
    posterPath: "/7pyhR5K1iv67daYw0DfsmsersKA.jpg",
  );
  final movieModel2 = MovieModel(
    title: "The Island",
    likes: 4303,
    popularity: 18.066,
    id: 1635,
    posterPath: "/rJonkVkNZB23VLeoA8iGvWWZ88Z.jpg",
  );
  SimilarMoviesModel similarModel =
      SimilarMoviesModel([movieModel1, movieModel2]);
  setUp(() {
    mockDataSource = MockSimilarMovieDataSourceImpl();
    repositoryImpl = SimilarMovieRepositoryImpl(dataSource: mockDataSource);
  });
  test('deve retornar um SimilarMovieModel atraves de um dado remoto',
      () async {
    when(mockDataSource.getSimilarMovies(params.id, params.page))
        .thenAnswer((realInvocation) async => similarModel);

    final result =
        await repositoryImpl.getSimilarMovies(params.id, params.page);

    expect(result, equals(Right(similarModel)));
  });
}
