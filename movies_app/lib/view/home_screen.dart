import 'package:flutter/material.dart';
import 'package:movies_app/view/component/home_screen/carousel_movie.dart';
import 'package:movies_app/view/component/home_screen/carousel_promo.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselPromo(),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Now Playing',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 70, 46),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              CarouselMovie(),
            ],
          ),
        ),
      ),
    );
  }
}
