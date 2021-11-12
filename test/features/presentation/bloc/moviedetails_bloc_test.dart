import 'package:app_movie/core/error/ErrorMessages.dart';
import 'package:app_movie/core/error/Exceptions/ServerException.dart';
import 'package:app_movie/core/error/Failures.dart/ServerFailure.dart';
import 'package:app_movie/core/utils/SimilarParameters.dart';
import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/data/models/movieModel.dart';
import 'package:app_movie/features/data/models/similarMoviesModel.dart';
import 'package:app_movie/features/domain/entities/SimilarMovies.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/features/domain/usecases/GetMovieDetailsUsecase.dart';
import 'package:app_movie/features/domain/usecases/GetSimilarMovieUsecase.dart';
import 'package:app_movie/features/presentation/bloc/moviedetails_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'moviedetails_bloc_test.mocks.dart';

@GenerateMocks([GetMovieDetails, GetSimilarMovies])
void main() {
  late MockGetMovieDetails mockGetMovieDetails;
  late MockGetSimilarMovies mockGetSimilarMovies;
  late MoviedetailsBloc bloc;
  final params = Parameters(id: 550);
  final similarParams = SimilarMovieParameters(id: 550, page: 1);
  final movie = Movie(
      id: 550,
      popularity: 46.864,
      title: "Fight Club",
      likes: 22325,
      posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg");
  final movie1 = Movie(
    title: "The 13th Warrior",
    likes: 1350,
    popularity: 21.949,
    id: 1911,
    posterPath: "/7pyhR5K1iv67daYw0DfsmsersKA.jpg",
  );
  final movie2 = Movie(
    title: "The Island",
    likes: 4303,
    popularity: 18.066,
    id: 1635,
    posterPath: "/rJonkVkNZB23VLeoA8iGvWWZ88Z.jpg",
  );
  SimilarMovies similarModel = SimilarMovies(similarMovies: [movie1, movie2]);
  setUp(() {
    mockGetMovieDetails = MockGetMovieDetails();
    mockGetSimilarMovies = MockGetSimilarMovies();
    bloc = MoviedetailsBloc(
      getMovieDetails: mockGetMovieDetails,
      getSimilarMovies: mockGetSimilarMovies,
    );
  });
  test('Deve receber dados pelo usecase', () {
    when(mockGetMovieDetails(any))
        .thenAnswer((realInvocation) async => Right(movie));
    when(mockGetSimilarMovies(any))
        .thenAnswer((realInvocation) async => Right(similarModel));
    bloc.add(
        GetMovieDetailsEvent(params: params, similarParams: similarParams));

    expectLater(
        bloc.stream,
        emitsInOrder([
          MoviedetailsLoadedState(movie: movie, similarMovies: similarModel)
        ]));
  });
  test(
      'Deve retornar um estado de Falha caso não seja possivel carregar os dados do usecase movie Details',
      () {
    when(mockGetMovieDetails(any))
        .thenAnswer((realInvocation) async => Left(ServerFailure()));
    when(mockGetSimilarMovies(any))
        .thenAnswer((realInvocation) async => Right(similarModel));
    bloc.add(
        GetMovieDetailsEvent(params: params, similarParams: similarParams));

    expectLater(
        bloc.stream,
        emitsInOrder(
            [MoviedetailsErrorState(message: SERVER_FAILURE_MESSAGE)]));
  });
  test(
      'Deve retornar um estado de Falha caso não seja possivel carregar os dados do usecase SimilarMovie',
      () {
    when(mockGetMovieDetails(any))
        .thenAnswer((realInvocation) async => Right(movie));
    when(mockGetSimilarMovies(any))
        .thenAnswer((realInvocation) async => Left(ServerFailure()));
    bloc.add(
        GetMovieDetailsEvent(params: params, similarParams: similarParams));

    expectLater(
        bloc.stream,
        emitsInOrder(
            [MoviedetailsErrorState(message: SERVER_FAILURE_MESSAGE)]));
  });
  test(
      'Deve retornar um estado de Falha caso não seja possivel carregar os dados do usecase SimilarMovie, e do usecase movie Details',
      () {
    when(mockGetMovieDetails(any))
        .thenAnswer((realInvocation) async => Left(ServerFailure()));
    when(mockGetSimilarMovies(any))
        .thenAnswer((realInvocation) async => Left(ServerFailure()));
    bloc.add(
        GetMovieDetailsEvent(params: params, similarParams: similarParams));

    expectLater(
        bloc.stream,
        emitsInOrder(
            [MoviedetailsErrorState(message: SERVER_FAILURE_MESSAGE)]));
  });
}
