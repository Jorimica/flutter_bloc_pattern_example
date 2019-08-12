import 'dart:async';
import 'movies_api_provider.dart';
import '../models/movies_response.dart';

class MoviesRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<MoviesResponse> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}