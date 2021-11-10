import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/features/domain/usecases/GetMovieDetailsUsecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'moviedetails_event.dart';
part 'moviedetails_state.dart';

class MoviedetailsBloc extends Bloc<MoviedetailsEvent, MoviedetailsState> {
  final GetMovieDetails getMovieDetails;

  MoviedetailsBloc({required this.getMovieDetails})
      : super(MoviedetailsInitialState());
  @override
  Stream<MoviedetailsState> mapEventToState(MoviedetailsEvent event) async* {
    if (event is GetMovieDetailsEvent) {
      final failureOrMovie = await getMovieDetails(event.params);
      yield failureOrMovie.fold(
        (failure) => throw UnimplementedError(),
        (movie) => MoviedetailsLoadedState(movie: movie),
      );
    }
  }
}
