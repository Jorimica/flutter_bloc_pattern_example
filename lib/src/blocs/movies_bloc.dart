import '../resources/movies_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movies_response.dart';

class MoviesBloc {
  final _repository = MoviesRepository();
  final _moviesFetcher = PublishSubject<MoviesResponse>();

  Observable<MoviesResponse> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    MoviesResponse itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();