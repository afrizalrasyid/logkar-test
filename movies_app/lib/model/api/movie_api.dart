import 'package:dio/dio.dart';
import 'package:movies_app/model/character_model.dart';
import 'package:movies_app/model/movie_model.dart';

class MovieApi {
  static Future<List<Movie>> getMovie() async {
    final response = await Dio().get('https://swapi.dev/api/films/');

    final List results = response.data['results'];

    final movies = results.asMap().entries.map((entry) {
      final index = entry.key;
      final e = entry.value;

      return Movie(
        id: (index + 1).toString(),
        title: e['title'],
        episode: e['episode_id'].toString(),
        summary: e['opening_crawl'],
        director: e['director'],
        producer: e['producer'],
        releaseDate: e['release_date'],
        characters: List<String>.from(e['characters']),
      );
    }).toList();

    return movies;
  }

  static Future<List<CharacterModel>> getCharacters(
    List<String> characterUrls,
  ) async {
    final dio = Dio();

    final responses = await Future.wait(
      characterUrls.map((url) => dio.get(url)),
    );

    final characters = responses.map((response) {
      final data = response.data;

      return CharacterModel(name: data['name']);
    }).toList();
    return characters;
  }
}
