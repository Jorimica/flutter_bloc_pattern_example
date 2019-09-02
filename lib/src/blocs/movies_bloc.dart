import '../resources/movies_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movies_response.dart';

/* A Business Logic Component (BLoC) class. It implements a reactive approach.
* In general terms, data will be flowing from the BLOC to the UI or from UI
* to the BLOC in the form of streams.*/
class MoviesBloc {
  final _repository = MoviesRepository();
  final _moviesFetcher = PublishSubject<MoviesResponse>();

  Observable<MoviesResponse> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    MoviesResponse moviesResponse = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(moviesResponse);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();