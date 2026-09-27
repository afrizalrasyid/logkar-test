import 'package:flutter/material.dart';
import 'package:movies_app/model/character_model.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/viewmodel/movie_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatefulWidget {
  final String movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  Movie? _movie;
  List<CharacterModel> _characters = [];

  String formatSummary(String raw) {
    final paragraphs = raw.split('\r\n\r\n');
    final cleaned = paragraphs
        .map((p) => p.replaceAll('\r\n', ' ').trim())
        .where((p) => p.isNotEmpty);
    return cleaned.join('\n\n');
  }

  @override
  void initState() {
    super.initState();
    getMovieData();
  }

  Future<void> getMovieData() async {
    final viewModel = Provider.of<MovieViewModel>(context, listen: false);

    final movie = await viewModel.getMovieById(widget.movieId);

    final characters = await viewModel.getCharacters(movie.characters);

    if (!mounted) return;

    setState(() {
      _movie = movie;
      _characters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_movie == null) {
      return const Center(
        child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/home/img_movie_icon.png',
                          width: 150,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _movie!.title,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Episode: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                _movie!.episode,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Director: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                _movie!.director,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Producers: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  _movie!.producer,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Release date: ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  _movie!.releaseDate,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Story line',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    formatSummary(_movie!.summary),
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Character in movie',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        _characters
                            .map((character) => character.name)
                            .join(', '),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
