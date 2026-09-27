import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/view/movie_detail_screen.dart';
import 'package:movies_app/viewmodel/movie_view_model.dart';
import 'package:provider/provider.dart';

class CarouselMovie extends StatefulWidget {
  const CarouselMovie({super.key});

  @override
  State<CarouselMovie> createState() => CarouselMovieState();
}

class CarouselMovieState extends State<CarouselMovie> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieViewModel>(context, listen: false).fetchMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<MovieViewModel>(context);

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: modelView.movies.length,
          itemBuilder: (context, index, realIndex) {
            final movie = modelView.movies[index];

            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 233, 233, 233),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailScreen(movieId: movie.id),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 220),
                        Image.asset(
                          'assets/images/home/img_movie_icon.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Center(
                          child: Text(
                            movie.title,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 300,
            // autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }
}
