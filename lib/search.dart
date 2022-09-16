import 'package:flutter/material.dart';
import 'categories/python.dart';
import 'categories/dart.dart';
import 'categories/java.dart';
import 'categories/cplusplus.dart';
import 'categories/javascript.dart';
import 'home_page.dart';
import 'favorite.dart';

class search extends StatefulWidget {
  final List<String> list = [
    "Java",
    "java",
    "Dart",
    "dart",
    "javascript",
    "JavaScript",
    "javaScript",
    "cplusplus",
    "c++",
    "C++",
    "Cplusplus",
    "python",
    "Python",
    "Home",
    "Favorites",
    "Ruby",
    "Home",
    "home",
    "favorite",
    "Favorite"
  ];

  @override
  _SearchState createState() => _SearchState();
}

String selectedResult = "";

class _SearchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent.shade700,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.list));
            },
            icon: Icon(Icons.search),
          )
        ],
        centerTitle: true,
        title: Text('Search Bar'),
      ),
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            widget.list[index],
          ),
        ),
      ),
    );
  }
}

class Search extends SearchDelegate {
  void displaySearch(BuildContext context) {
    if (selectedResult == "Java" || selectedResult == "java") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => JavaPage()));
    } else if (selectedResult == "Dart" || selectedResult == "dart") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DartPage()));
    } else if (selectedResult == "javaScript" ||
        selectedResult == "JavaScript" ||
        selectedResult == "javascript") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => JavascriptPage()));
    } else if (selectedResult == "python" || selectedResult == "Python") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PythonPage()));
    } else if (selectedResult == "cplusplus" ||
        selectedResult == "Cplusplus" ||
        selectedResult == "c++" ||
        selectedResult == "C++") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CPlusPlusPage()));
    }
    else if (selectedResult == "home" ||
        selectedResult == "Home") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
    else if (selectedResult == "favorite" ||
        selectedResult == "Favorite") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoritePage()));
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox.shrink();
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Home", "Favorite"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
            displaySearch(context);
          },
        );
      },
    );
  }
}
