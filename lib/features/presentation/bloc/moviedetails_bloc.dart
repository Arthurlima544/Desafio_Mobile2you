import 'package:app_movie/core/error/ErrorMessages.dart';
import 'package:app_movie/core/utils/SimilarParameters.dart';
import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/domain/entities/SimilarMovies.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/features/domain/usecases/GetMovieDetailsUsecase.dart';
import 'package:app_movie/features/domain/usecases/GetSimilarMovieUsecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'moviedetails_event.dart';
part 'moviedetails_state.dart';

class MoviedetailsBloc extends Bloc<MoviedetailsEvent, MoviedetailsState> {
  final GetMovieDetails getMovieDetails;
  final GetSimilarMovies getSimilarMovies;

  MoviedetailsBloc(
      {required this.getMovieDetails, required this.getSimilarMovies})
      : super(MoviedetailsInitialState());
  @override
  Stream<MoviedetailsState> mapEventToState(MoviedetailsEvent event) async* {
    if (event is GetMovieDetailsEvent) {
      final failureOrMovie = await getMovieDetails(event.params);
      final failureOrSimilarMovie = await getSimilarMovies(event.similarParams);

      if (failureOrSimilarMovie.isLeft() || failureOrMovie.isLeft()) {
        yield MoviedetailsErrorState(message: SERVER_FAILURE_MESSAGE);
      } else {
        var rightMovie;
        var rightSimilarMovie;
        rightMovie = failureOrMovie.fold(
          (failure) => failure,
          (movie) => movie,
        );
        rightSimilarMovie = failureOrSimilarMovie.fold(
          (failure) => failure,
          (movie) => movie,
        );
        yield MoviedetailsLoadedState(
            movie: rightMovie, similarMovies: rightSimilarMovie);
      }
    }
  }
}
