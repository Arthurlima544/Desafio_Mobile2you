import 'dart:ui';

import 'package:app_movie/features/domain/entities/movie.dart';
import 'package:app_movie/features/domain/usecases/GetMovieDetailsUsecase.dart';
import 'package:app_movie/features/presentation/bloc/moviedetails_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: BlocBuilder<MoviedetailsBloc, MoviedetailsState>(
        builder: (context, state) {
          if (state is MoviedetailsLoadedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.network(
                      "http://image.tmdb.org/t/p/w500${state.movie.posterPath}",
                    ),
                  ),
                  CardMovieDetails(movie: state.movie),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class CardMovieDetails extends StatelessWidget {
  final Movie movie;
  const CardMovieDetails({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "${movie.title}",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 50)),
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 12,
                ),
                Text(
                  "${movie.likes} likes",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 70)),
                Text(
                  "${movie.popularity} popularity",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
