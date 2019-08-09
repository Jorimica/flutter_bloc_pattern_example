import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_example/src/models/item_model.dart';

import 'movie_detail.dart';

class MovieItem extends StatelessWidget {
  final String _movieImageUrl = 'https://image.tmdb.org/t/p/w185';
  String _posterPath;
  String _title;
  String _releaseDate;
  Result _result;

  MovieItem(Result result) {
    _posterPath = result.posterPath;
    _title = result.title;
    _releaseDate = result.releaseDate;
    _result = result;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetail(_result))
        );
      },
      child: Card(
        elevation: 4,
        child: Column(
          children: <Widget>[
            Image.network(
              '$_movieImageUrl$_posterPath',
              fit: BoxFit.fill,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  _title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 14
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Text(
                  'Release date: $_releaseDate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}