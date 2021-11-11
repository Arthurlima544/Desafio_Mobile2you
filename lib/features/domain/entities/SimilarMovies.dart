import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class SimilarMovies extends Equatable {
  final List<Movie> similarMovies;

  SimilarMovies({required this.similarMovies});

  @override
  List<Object?> get props => [similarMovies];
}
