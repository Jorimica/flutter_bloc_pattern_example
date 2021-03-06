import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_example/src/models/movies_response.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;

  MovieDetail(this.movie);

  @override
  State<StatefulWidget> createState() => _MovieDetailState(movie);
}

class _MovieDetailState extends State<MovieDetail> {
  final String _appBarTitle = "Movie Details";
  final String _movieImageUrl = 'https://image.tmdb.org/t/p/w185';
  String _posterPath;
  String _title;
  String _releaseDate;
  String _overview;
  final String _releaseDateLabel = 'Release date: ';
  final String _overviewLabel = 'Overview: ';

  _MovieDetailState(Movie movie) {
    _posterPath = movie.posterPath;
    _title = movie.title;
    _releaseDate = movie.releaseDate;
    _overview = movie.overview;
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
            Center(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text(
                      _title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title
                  )
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Text(
                  '$_overviewLabel$_overview',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.body1
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Text(
                  '$_releaseDateLabel$_releaseDate',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.body2
                )
            ),
          ],
        ),
      ),
    );
  }
}