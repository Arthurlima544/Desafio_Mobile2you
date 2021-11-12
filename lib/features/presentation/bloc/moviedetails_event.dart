part of 'moviedetails_bloc.dart';

abstract class MoviedetailsEvent extends Equatable {
  const MoviedetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MoviedetailsEvent {
  final Parameters params;
  final SimilarMovieParameters similarParams;

  GetMovieDetailsEvent({
    required this.params,
    required this.similarParams,
  });
  @override
  List<Object> get props => [params, similarParams];
}
