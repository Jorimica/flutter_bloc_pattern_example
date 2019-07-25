import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final _movieImageUrl = 'https://image.tmdb.org/t/p/w185';
  final String _posterPath;
  final String _title;
  final String _releaseDate;

  MovieItem(this._posterPath, this._title, this._releaseDate);

  @override
  Widget build(BuildContext context) {
    return new Card(
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
                    color: Colors.amber
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Text(
                'Release date: $_releaseDate',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white
                ),
              )
          )
        ],
      ),
    );
  }

}