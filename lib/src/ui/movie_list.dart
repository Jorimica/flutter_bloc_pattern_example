import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_example/src/ui/size_config.dart';
import '../models/movies_response.dart';
import '../blocs/movies_bloc.dart';
import 'movie_item.dart';

/* A stateful widget is dynamic: for example, it can change its appearance in
response to events triggered by user interactions or when it receives data.*/
class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MovieListState();
}

/* A widget’s state is stored in a State object, separating the widget’s state
from its appearance. The state consists of values that can change, like a slider’s
current value or whether a checkbox is checked.*/
class _MovieListState extends State<MovieList> {
  /*Unlike Java, Dart does not have the keywords public, protected, and private.
  If an identifier starts with an underscore (_), it’s private to its library*/
  final _title = 'Popular Movies';
  final itemsPerPage = 20;
  var _isLoading = false;
  ScrollController _scrollController;
  // In Dart, arrays are dynamic size List objects, so most people just call them lists.
  List<Movie> _movieList = [];

  @override
  void initState() {
    super.initState();
    // We use the BLoC object to access the data
    bloc.fetchAllMovies();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        if (!_isLoading) {
          _isLoading = !_isLoading;
          bloc.fetchAllMovies();
          _isLoading = false;
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
      /* StreamBuilder: Widget that builds itself based on the latest snapshot
      of interaction with a Stream.*/
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<MoviesResponse> snapshot) {
          if (snapshot.hasData) {
            if(_movieList.length < itemsPerPage*snapshot.data.page) {
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