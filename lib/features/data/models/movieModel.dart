import 'package:app_movie/features/domain/entities/movie.dart';

class MovieModel extends Movie {
  final int id;
  final String title;
  final int likes;
  final double popularity;

  MovieModel({
    required this.id,
    required this.title,
    required this.likes,
    required this.popularity,
  }) : super(
          id: id,
          title: title,
          likes: likes,
          popularity: popularity,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      likes: json['vote_count'],
      title: json['title'],
      popularity: json['popularity'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['vote_count'] = this.likes;
    return data;
  }
}
