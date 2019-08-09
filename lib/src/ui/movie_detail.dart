import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_example/src/models/item_model.dart';

class MovieDetail extends StatelessWidget {
  final String _appBarTitle = "Movie Details";
  final String _movieImageUrl = 'https://image.tmdb.org/t/p/w185';
  String _posterPath;
  String _title;
  String _releaseDate;
  String _overview;
  final String _releaseDateLabel = 'Release date: ';
  final String _overviewLabel = 'Overview: ';

  MovieDetail(Result result) {
    _posterPath = result.posterPath;
    _title = result.title;
    _releaseDate = result.releaseDate;
    _overview = result.overview;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: buildMovieDetail(context)
    );
  }

  Widget buildMovieDetail(BuildContext context) {
    return new SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Image.network(
                '$_movieImageUrl$_posterPath',
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text(
                  _title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 14
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Text(
                  '$_overviewLabel$_overview',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Text(
                  '$_releaseDateLabel$_releaseDate',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}