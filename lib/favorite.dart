import 'package:flutter/material.dart';
import 'categories/java.dart';
import 'categories/dart.dart';
import 'categories/javascript.dart';
import 'categories/python.dart';
import 'categories/cplusplus.dart';

class FavoritePage extends StatefulWidget {
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool _isPressed = false;
  void _myCallback() {
    setState(() {
      _isPressed = true;
    });
  }

  List<String> mainDataList = [
    "Java",
    "JavaScript",
    "C++",
    "Dart",
    "Python",
  ];

  static List<String> favoriteDataList = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
          backgroundColor: Colors.indigoAccent.shade700,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.article_rounded)),
              Tab(icon: Icon(Icons.favorite)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: mainDataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            mainDataList[index],
                            style: const TextStyle(fontSize: 19.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isPressed == false ? _myCallback : null;
                            favoriteDataList.add(mainDataList[index]);
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 10, 20, 75),
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                );
              },
            ),
            favoriteDataList.isEmpty
                ? const Center(
                    child: Text(
                      'There are no favorites yet!',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : ListView.builder(
                    itemCount: favoriteDataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  favoriteDataList[index],
                                  style: const TextStyle(fontSize: 19.0),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  favoriteDataList
                                      .remove(favoriteDataList[index]);
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 10, 20, 75),
                                ),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                if (favoriteDataList[index] == "Java") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => JavaPage()));
                                } else if (favoriteDataList[index] == "Dart") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DartPage()));
                                } else if (favoriteDataList[index] ==
                                    "JavaScript") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              JavascriptPage()));
                                } else if (favoriteDataList[index] ==
                                    "Python") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PythonPage()));
                                } else if (favoriteDataList[index] == "C++") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CPlusPlusPage()));
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.deepPurple,
                                ),
                              ),
                              child: Column(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(
                                    Icons.call_made_rounded,
                                    color: Colors.white,
                                  ),
                                  //Text(favoriteDataList[index])
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
