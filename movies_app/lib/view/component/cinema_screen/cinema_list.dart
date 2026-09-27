import 'package:flutter/material.dart';
import 'package:movies_app/view/cinema_detail_screen.dart';
import 'package:movies_app/viewmodel/cinema_view_model.dart';
import 'package:provider/provider.dart';

class CinemaList extends StatefulWidget {
  const CinemaList({super.key});

  @override
  State<CinemaList> createState() => CinemaListState();
}

class CinemaListState extends State<CinemaList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CinemaViewModel>(context, listen: false).fetchCinema();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<CinemaViewModel>(context);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: modelView.cinemas.length,
      itemBuilder: (context, index) {
        final cinema = modelView.cinemas[index];

        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CinemaDetailScreen(cinema: cinema),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 233, 233, 233),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cinema.name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
