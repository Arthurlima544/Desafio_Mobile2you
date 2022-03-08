import 'dart:convert';
import 'dart:io';

import 'package:app_movie/features/data/models/movieModel.dart';
import 'package:app_movie/features/data/models/similarMoviesModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  File file;
  dynamic json;

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
  setUp(() async {
    file = File('assets/similarMovie.json');
    json = jsonDecode(await file.readAsString());
  });
  test('Deve retornar os dados vindos do json no formato esperado', () {
    SimilarMoviesModel expectModel =
        SimilarMoviesModel([movieModel1, movieModel2]);

    final result = SimilarMoviesModel.fromJson(json);

    expect(result, expectModel);
  });
}
