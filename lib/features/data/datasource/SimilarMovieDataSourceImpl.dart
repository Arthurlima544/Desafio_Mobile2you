import 'dart:convert';

import 'package:app_movie/features/data/models/similarMoviesModel.dart';
import 'package:http/http.dart' as http;
import 'SimilarMovieDataSource.dart';

const apikey = '7337382d96bcf0c1131c7f4b46fb20b7';

class SimilarMovieDataSourceImpl implements SimilarMovieDataSource {
  final http.Client client;

  SimilarMovieDataSourceImpl({required this.client});
  @override
  Future<SimilarMoviesModel> getSimilarMovies(int id, int page) async {
    String url =
        "https://api.themoviedb.org/3/movie/$id/similar?api_key=$apikey&page=$page";
    final response = await client.get(Uri.parse(url));

    return SimilarMoviesModel.fromJson(json.decode(response.body));
  }
}
