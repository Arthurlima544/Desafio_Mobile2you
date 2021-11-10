import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/data/models/movieModel.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/features/domain/usecases/GetMovieDetailsUsecase.dart';
import 'package:app_movie/features/presentation/bloc/moviedetails_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'moviedetails_bloc_test.mocks.dart';

@GenerateMocks([GetMovieDetails])
void main() {
  late MockGetMovieDetails mockGetMovieDetails;
  late MoviedetailsBloc bloc;
  final params = Parameters(id: 550);
  final movie =
      Movie(id: 550, popularity: 46.864, title: "Fight Club", likes: 22325);
  setUp(() {
    mockGetMovieDetails = MockGetMovieDetails();
    bloc = MoviedetailsBloc(getMovieDetails: mockGetMovieDetails);
  });
  test('Deve receber dados pelo usecase', () {
    when(mockGetMovieDetails(params))
        .thenAnswer((realInvocation) async => Right(movie));
    bloc.add(GetMovieDetailsEvent(params: params));

    expectLater(
        bloc.stream, emitsInOrder([MoviedetailsLoadedState(movie: movie)]));
  });
}
