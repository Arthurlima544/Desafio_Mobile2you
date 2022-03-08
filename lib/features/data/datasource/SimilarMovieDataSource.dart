import 'package:app_movie/features/data/models/MovieModel.dart';
import 'package:app_movie/features/data/models/similarMoviesModel.dart';

abstract class SimilarMovieDataSource {
  Future<SimilarMoviesModel> getSimilarMovies(int id, int page);
}
