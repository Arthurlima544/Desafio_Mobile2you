import 'dart:convert';

import 'package:app_movie/core/error/Exceptions/ServerException.dart';
import 'package:app_movie/features/data/datasource/MovieRemoteDataSource.dart';
import 'package:app_movie/features/data/models/MovieModel.dart';
import 'package:http/http.dart' as http;

const apikey = '7337382d96bcf0c1131c7f4b46fb20b7';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});
  @override
  Future<MovieModel> getmovieDetails(int id) async {
    String url = "https://api.themoviedb.org/3/movie/$id?api_key=$apikey";
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    }
    throw ServerException(message: "Não foi possivel realizar requisição");
  }
}
