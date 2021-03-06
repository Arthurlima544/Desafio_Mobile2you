import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final int likes;
  final double popularity;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.likes,
    required this.popularity,
    required this.posterPath,
  });

  @override
  List<Object?> get props => [id, title, likes, popularity, posterPath];
}
