part of 'moviedetails_bloc.dart';

abstract class MoviedetailsEvent extends Equatable {
  const MoviedetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MoviedetailsEvent {
  final Parameters params;

  GetMovieDetailsEvent({required this.params});
  @override
  List<Object> get props => [params];
}
