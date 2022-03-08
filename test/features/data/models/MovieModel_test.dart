import 'dart:convert';
import 'dart:io';

import 'package:app_movie/features/data/models/MovieModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final movieModel = MovieModel(
    title: "Fight Club",
    likes: 22325,
    popularity: 46.864,
    id: 550,
    posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
  );
  File file;
  dynamic json;
  setUp(() async {
    file = File('assets/movie.json');
    json = jsonDecode(await file.readAsString());
  });
  test('deve retornar um Movie Model valido ao receber dados json', () {
    //act
    final result = MovieModel.fromJson(json);

    expect(result, movieModel);
  });
}
