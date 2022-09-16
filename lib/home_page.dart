import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'favorite.dart';
import 'Home_1.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //python = 7

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    Home_1(),
    FavoritePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final PythonImage =
    //   'https://www.freepngimg.com/download/android/72537-icons-python-programming-computer-social-tutorial.png';

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),

      //
      bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          color: Colors.indigoAccent.shade700,
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.favorite, color: Colors.white),
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
