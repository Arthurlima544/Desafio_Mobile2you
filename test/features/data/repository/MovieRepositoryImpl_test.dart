import 'package:app_movie/core/error/Exceptions/ServerException.dart';
import 'package:app_movie/core/error/Failures.dart/ServerFailure.dart';
import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/data/datasource/MovieRemoteDataSource.dart';
import 'package:app_movie/features/data/datasource/MovieRemoteDataSourceImpl.dart';
import 'package:app_movie/features/data/models/MovieModel.dart';
import 'package:app_movie/features/data/repository/MovieRepositoryImpl.dart';
import 'package:app_movie/features/domain/repository/MovieDetailsRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'MovieRepositoryImpl_test.mocks.dart';

@GenerateMocks([MovieRemoteDataSourceImpl])
void main() {
  late MockMovieRemoteDataSourceImpl mockRemoteDataSource;
  late MovieDetailsRepositoryImpl repositoryImpl;
  final params = Parameters(id: 550);
  final movieModel = MovieModel(
    title: "Fight Club",
    likes: 22325,
    popularity: 46.864,
    id: 550,
    posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
  );
  setUp(() {
    mockRemoteDataSource = MockMovieRemoteDataSourceImpl();
    repositoryImpl =
        MovieDetailsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });
  test('deve retornar um model atraves do dado remoto', () async {
    when(mockRemoteDataSource.getmovieDetails(params.id))
        .thenAnswer((realInvocation) async => movieModel);
    final result = await repositoryImpl.getmovieDetails(params.id);
    verify(mockRemoteDataSource.getmovieDetails(params.id));
    expect(result, equals(Right(movieModel)));
  });

  test(
      'Deve retornar ServerFailure quando não for possivel chamar dados remotos',
      () async {
    when(mockRemoteDataSource.getmovieDetails(params.id)).thenThrow(
        ServerException(message: "Não foi possivel realizar requisição"));
    final result = await repositoryImpl.getmovieDetails(params.id);
    verify(mockRemoteDataSource.getmovieDetails(params.id));
    verifyNoMoreInteractions(mockRemoteDataSource);
    expect(result, Left(ServerFailure()));
  });
}
