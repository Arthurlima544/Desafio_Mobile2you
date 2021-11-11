import 'package:app_movie/features/domain/entities/SimilarMovies.dart';
import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

import 'movieModel.dart';

class SimilarMoviesModel extends Equatable {
  List<MovieModel> similarMovies = <MovieModel>[];

  SimilarMoviesModel(this.similarMovies);

  SimilarMoviesModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      json['results'].forEach((element) {
        similarMovies.add(new MovieModel.fromJson(element));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.similarMovies != null) {
      data['results'] = this.similarMovies.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [similarMovies];
}
