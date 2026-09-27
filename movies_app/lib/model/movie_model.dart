class Movie {
  final String id;
  final String title;
  final String episode;
  final String summary;
  final String director;
  final String producer;
  final String releaseDate;
  final List<String> characters;

  Movie({
    required this.id,
    required this.title,
    required this.episode,
    required this.summary,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
  });
}
