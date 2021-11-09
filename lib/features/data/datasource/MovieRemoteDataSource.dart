import 'package:app_movie/features/data/models/MovieModel.dart';

abstract class MovieRemoteDataSource {
  Future<MovieModel> getmovieDetails(int id);
}
