import 'dart:convert';

import 'package:app_movie/core/utils/SimilarParameters.dart';
import 'package:app_movie/features/data/datasource/SimilarMovieDataSourceImpl.dart';
import 'package:app_movie/features/data/models/movieModel.dart';
import 'package:app_movie/features/data/models/similarMoviesModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'MovieRemoteDataSourceImpl_test.mocks.dart';

const apikey = '7337382d96bcf0c1131c7f4b46fb20b7';
@GenerateMocks([http.Client])
void main() {
  late SimilarMovieDataSourceImpl dataSource;
  final params = SimilarMovieParameters(id: 550, page: 1);

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
  late MockClient mockClient;
  setUp(() {
    mockClient = MockClient();
    dataSource = SimilarMovieDataSourceImpl(client: mockClient);
  });
  test(
      'deve ser feito uma requisição get e obtido um model igual ao similarModel',
      () async {
    final url =
        "https://api.themoviedb.org/3/movie/${params.id}/similar?api_key=$apikey&page=${params.page}";
    when(mockClient.get(Uri.parse(url))).thenAnswer((realInvocation) async =>
        http.Response(json.encode(similarModel.toJson()), 200));

    final result = await dataSource.getSimilarMovies(params.id, params.page);

    expect(result, equals(similarModel));
  });
}
