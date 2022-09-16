import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project1/navigate.dart';
import 'categories/cplusplus.dart';
import 'categories/dart.dart';
import 'categories/java.dart';
import 'categories/javascript.dart';
import 'categories/python.dart';
import 'search.dart';

class Home_1 extends StatefulWidget {
  @override
  _Home_1State createState() => _Home_1State();
}

class _Home_1State extends State<Home_1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final PythonImage =
    //   'https://www.freepngimg.com/download/android/72537-icons-python-programming-computer-social-tutorial.png';

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent.shade700,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => search()));
              },
              icon: Icon(Icons.search),
            )
          ],
          centerTitle: true,
          title: Text('Home'),
        ),
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('images/homeBackground.png',
                        fit: BoxFit.cover),
                  ),
                ),
                /* decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1581091878330-f5cf2a3b1564?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
            fit: BoxFit.cover,
          )), */
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    highlightColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PythonPage()));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text('Python',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                backgroundColor:
                                                    Colors.transparent,
                                                fontWeight: FontWeight.bold)),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/home_icon/pythonImage.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.blue[400],
                                        )),
                                  )))),
                      Container(
                          margin: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    highlightColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  JavaPage()));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text('Java',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/home_icon/javaImage.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.blue[400],
                                        )),
                                  )))),
                      Container(
                          margin: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    highlightColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CPlusPlusPage()));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text('C++',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/home_icon/CPlusPlus.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.blue[400],
                                        )),
                                  )))),
                      Container(
                          margin: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    highlightColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DartPage()));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text('Dart',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/home_icon/dart.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.blue[400],
                                        )),
                                  )))),
                      Container(
                          margin: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    highlightColor:
                                        Color(0xFF80D8FF).withOpacity(0.2),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  JavascriptPage()));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text('JavaScript',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/home_icon/javascript.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.blue[400],
                                        )),
                                  )))),
                    ],
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        mainAxisExtent: 185),
                  ),
                )
              ],

              //
            )));
  }
}
