import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/features/domain/repository/MovieDetailsRepository.dart';
import 'package:app_movie/features/domain/usecases/GetMovieDetailsUsecase.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMovieDetailsRepository extends Mock
    implements MovieDetailsRepository {}

void main() {
  final movie = Movie(
    title: "MovieTest",
    id: 505,
    likes: 55,
    popularity: 55.2,
  );
  test(
      'deve retornar um objeto do Tipo Movie ao chamar um usecase especificando um parametro',
      () async {
    final repo = MockMovieDetailsRepository();
    final params = Parameters(id: 505);
    final usecase = GetMovieDetails(repo);

    when(repo.getmovieDetails(params))
        .thenAnswer((realInvocation) async => Right(movie));

    final result = await usecase.call(params);

    expect(result, Right(movie));
  });
}
