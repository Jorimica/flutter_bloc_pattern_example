import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_example/src/models/movies_response.dart';
import 'package:flutter_bloc_pattern_example/src/ui/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

import 'movie_detail.dart';

class MovieItem extends StatefulWidget {
  final Movie movie;

  MovieItem(this.movie);

  @override
  State<StatefulWidget> createState() => _MovieItemState(movie);
}

class _MovieItemState extends State<MovieItem> {
  final String _movieImageUrl = 'https://image.tmdb.org/t/p/w185';
  String _posterPath;
  String _title;
  String _releaseDate;
  Movie _result;

  _MovieItemState(Movie movie) {
    _posterPath = movie.posterPath;
    _title = movie.title;
    _releaseDate = movie.releaseDate;
    _result = movie;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: '$_movieImageUrl$_posterPath',
              height: SizeConfig.aspectRatio*SizeConfig.screenHeight - SizeConfig.aspectRatio*SizeConfig.aspectRatio*SizeConfig.blockSizeHorizontal*90,
              alignment: Alignment.topCenter,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, SizeConfig.blockSizeVertical, 0, 0),
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
                padding: EdgeInsets.fromLTRB(0, SizeConfig.blockSizeVertical, 0, SizeConfig.blockSizeVertical),
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