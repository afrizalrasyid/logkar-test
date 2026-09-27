import 'package:flutter/material.dart';
import 'package:movies_app/view/cinema_screen.dart';
import 'package:movies_app/view/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const new({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentPageIndex = 0;
  final List<Widget> _screens = [HomeScreen(), CinemaScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 70, 46),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cinema23',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 199, 0),
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
      body: _screens[_currentPageIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(
            color: Color.fromARGB(255, 254, 199, 0),
          ),
          unselectedItemColor: Color.fromARGB(255, 254, 199, 0),
          selectedItemColor: Color.fromARGB(255, 254, 199, 0),
          backgroundColor: Color.fromARGB(255, 2, 70, 46),
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                color: Color.fromARGB(255, 254, 199, 0),
                Icons.local_movies_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Cinema',
            ),
          ],
        ),
      ),
    );
  }
}
