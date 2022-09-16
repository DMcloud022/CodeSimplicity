import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../home_1.dart';
import '../../search.dart';
import 'nav/python1.dart';
import '../../favorite.dart';

class PythonPage extends StatefulWidget {
  const PythonPage({Key? key}) : super(key: key);
  @override
  _MyPythonPageState createState() => _MyPythonPageState();
}

class _MyPythonPageState extends State<PythonPage> {
  //python = 7

  int _selectedIndex = 2;
  final List<Widget> _widgetOptions = [
    Home_1(),
    FavoritePage(),
    PythonNavPage(),
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
          animationDuration: Duration(milliseconds: 300),
          items: [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.favorite, color: Colors.white),
            Icon(Icons.assistant, color: Colors.white),
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
