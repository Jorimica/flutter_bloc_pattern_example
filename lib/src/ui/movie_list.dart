import 'package:flutter/material.dart';
import '../models/movies_response.dart';
import '../blocs/movies_bloc.dart';
import 'movie_item.dart';

class MovieList extends StatelessWidget {
  final _title = 'Popular Movies';

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<MoviesResponse> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MoviesResponse> snapshot, BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height)
        ),
        itemBuilder: (BuildContext context, int index) {
          return MovieItem(
            snapshot.data.results[index]
          );
        }
      )
    );
  }

}