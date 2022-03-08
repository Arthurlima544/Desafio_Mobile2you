import 'dart:io';

import 'package:app_movie/core/utils/SimilarParameters.dart';
import 'package:app_movie/core/utils/parameters.dart';
import 'package:app_movie/features/data/datasource/MovieRemoteDataSourceImpl.dart';
import 'package:app_movie/features/data/datasource/SimilarMovieDataSourceImpl.dart';
import 'package:app_movie/features/data/repository/MovieRepositoryImpl.dart';
import 'package:app_movie/features/data/repository/SimilarMovieRepositoryImpl.dart';
import 'package:app_movie/features/domain/repository/MovieDetailsRepository.dart';
import 'package:app_movie/features/domain/usecases/GetMovieDetailsUsecase.dart';
import 'package:app_movie/features/domain/usecases/GetSimilarMovieUsecase.dart';
import 'package:app_movie/features/presentation/pages/MovieDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'features/presentation/bloc/moviedetails_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MoviedetailsBloc(
          getMovieDetails: GetMovieDetails(
            MovieDetailsRepositoryImpl(
              remoteDataSource: MovieRemoteDataSourceImpl(
                client: http.Client(),
              ),
            ),
          ),
          getSimilarMovies: GetSimilarMovies(
            SimilarMovieRepositoryImpl(
              dataSource: SimilarMovieDataSourceImpl(
                client: http.Client(),
              ),
            ),
          ),
        )..add(GetMovieDetailsEvent(
            params: Parameters(id: 505),
            similarParams: SimilarMovieParameters(id: 505, page: 1))),
        child: MovieDetailsPage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Hello")),
    );
  }
}
