import 'package:flutter/material.dart';
import 'package:movies_app/model/api/movie_api.dart';
import 'package:movies_app/model/character_model.dart';
import 'package:movies_app/model/movie_model.dart';

class MovieViewModel with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future<void> fetchMovies() async {
    try {
      final allMovie = await MovieApi.getMovie();

      _movies = allMovie;
      notifyListeners();
    } catch (e) {
      print('Error fetching movie: $e');
    }
  }

  Future<Movie> getMovieById(String movieId) async {
    final allMovie = await MovieApi.getMovie();
    final detailMovie = allMovie.firstWhere((movie) => movie.id == movieId);
    return detailMovie;
  }

  Future<List<CharacterModel>> getCharacters(List<String> characterUrls) async {
    return await MovieApi.getCharacters(characterUrls);
  }
}
