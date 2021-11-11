import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: Placeholder()),
            CardMovieDetails(),
          ],
        ),
      ),
    );
  }
}

class CardMovieDetails extends StatelessWidget {
  const CardMovieDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: EdgeInsets.all(0),
          child: Text(
            "teste",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
