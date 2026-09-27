import 'package:flutter/material.dart';
import 'package:movies_app/view/component/bottom_navigation.dart';
import 'package:movies_app/viewmodel/cinema_view_model.dart';
// import 'package:movies_app/view/home_screen.dart';
import 'package:movies_app/viewmodel/movie_view_model.dart';
import 'package:provider/provider.dart';

// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieViewModel()),
        ChangeNotifierProvider(create: (_) => CinemaViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: BottomNavigation(),
      ),
    ),
  );
}
