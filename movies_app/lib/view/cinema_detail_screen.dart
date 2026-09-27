import 'package:flutter/material.dart';
import 'package:movies_app/model/cinema_model.dart';

class CinemaDetailScreen extends StatelessWidget {
  final CinemaModel cinema;

  const CinemaDetailScreen({super.key, required this.cinema});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cinema.name,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              cinema.address,
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),
            const SizedBox(height: 30),

            const Text(
              'Cinema Location',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Latitude: ${cinema.latitude}',
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),

            Text(
              'Longitude: ${cinema.longitude}',
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
