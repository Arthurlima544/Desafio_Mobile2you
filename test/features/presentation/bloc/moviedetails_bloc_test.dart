import 'package:app_movie/core/error/ErrorMessages.dart';
import 'package:app_movie/core/error/Exceptions/ServerException.dart';
import 'package:app_movie/core/error/Failures.dart/ServerFailure.dart';
import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/data/models/movieModel.dart';
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
  final movie = Movie(
      id: 550,
      popularity: 46.864,
      title: "Fight Club",
      likes: 22325,
      posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg");
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
    bloc.add(GetMovieDetailsEvent(params: params));

    expectLater(
        bloc.stream, emitsInOrder([MoviedetailsLoadedState(movie: movie)]));
  });
  test(
      'Deve retornar um estado de Falha caso não seja possivel carregar os dados do usecase',
      () {
    when(mockGetMovieDetails(any))
        .thenAnswer((realInvocation) async => Left(ServerFailure()));
    bloc.add(GetMovieDetailsEvent(params: params));

    expectLater(
        bloc.stream,
        emitsInOrder(
            [MoviedetailsErrorState(message: SERVER_FAILURE_MESSAGE)]));
  });
}
