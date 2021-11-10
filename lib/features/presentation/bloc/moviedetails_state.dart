part of 'moviedetails_bloc.dart';

abstract class MoviedetailsState extends Equatable {
  const MoviedetailsState();

  @override
  List<Object> get props => [];
}

class MoviedetailsInitialState extends MoviedetailsState {}

class MoviedetailsLoadedState extends MoviedetailsState {
  final Movie movie;

  MoviedetailsLoadedState({required this.movie});
  @override
  List<Object> get props => [movie];
}

class MoviedetailsLoadingState extends MoviedetailsState {}
