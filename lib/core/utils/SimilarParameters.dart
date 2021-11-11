import 'package:app_movie/core/utils/parameters.dart';

class SimilarMovieParameters extends Parameters {
  final int id;
  final int page;

  SimilarMovieParameters({
    required this.id,
    required this.page,
  }) : super(id: id);
}
