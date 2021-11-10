import 'dart:convert';

import 'package:app_movie/core/error/Exceptions/ServerException.dart';
import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/data/datasource/MovieRemoteDataSourceImpl.dart';
import 'package:app_movie/features/data/models/MovieModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'MovieRemoteDataSourceImpl_test.mocks.dart';

const apikey = '7337382d96bcf0c1131c7f4b46fb20b7';

@GenerateMocks([http.Client])
void main() {
  late MovieRemoteDataSourceImpl datasource;
  final params = Parameters(id: 550);
  String url =
      "https://api.themoviedb.org/3/movie/${params.id}?api_key=$apikey";
  final movieModel = MovieModel(
    title: "Fight Club",
    likes: 22325,
    popularity: 46.864,
    id: 550,
  );
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    datasource = MovieRemoteDataSourceImpl(client: mockClient);
  });
  test('deve ser feito uma requisição get e obtido um model ...', () async {
    when(mockClient.get(Uri.parse(url))).thenAnswer((realInvocation) async =>
        http.Response(json.encode(movieModel.toJson()), 200));

    final result = await datasource.getmovieDetails(params.id);

    expect(result, equals(movieModel));
  });

  test('deve ser feito uma requisição get e ocorrer uma ServerException',
      () async {
    when(mockClient.get(Uri.parse(url))).thenAnswer((realInvocation) async =>
        http.Response("Não foi possivel realizar requisição", 404));

    final call = datasource.getmovieDetails;

    expect(() => call(params.id), throwsA(TypeMatcher<ServerException>()));
  });
}
