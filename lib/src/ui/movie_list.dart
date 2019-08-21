import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_example/src/ui/size_config.dart';
import '../models/movies_response.dart';
import '../blocs/movies_bloc.dart';
import 'movie_item.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _title = 'Popular Movies';
  var isLoading = false;
  ScrollController _scrollController;
  List<Movie> _movieList = [];

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (!isLoading) {
          isLoading = !isLoading;
          bloc.fetchAllMovies();
          isLoading = false;
        }
      }
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<MoviesResponse> snapshot) {
          if (snapshot.hasData) {
            if(_movieList.length < 20*snapshot.data.page) {
              _movieList.addAll(snapshot.data.results);
            }
            return buildList(_movieList, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(List<Movie> movieList, BuildContext context) {
    return Container(
      child: GridView.builder(
        controller: _scrollController,
        itemCount: movieList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height)
        ),
        itemBuilder: (BuildContext context, int index) {
          return MovieItem(
              movieList[index]
          );
        }
      )
    );
  }
}