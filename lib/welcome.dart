import 'package:flutter/material.dart';
import 'package:project1/about_page.dart';
import 'package:project1/home_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logo =
        'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png';
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset('images/Welcome2.jpg', fit: BoxFit.cover),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.network(
                          logo,
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      radius: 110,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Code Simplicity',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 80),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor:
                                      Color(0xFF80D8FF).withOpacity(0.5),
                                  highlightColor:
                                      Color(0xFF80D8FF).withOpacity(0.3),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Text('Start Learning',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white, width: 4))),
                                )))),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutUsPage()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Color(0xFF303F9F),
                          padding: EdgeInsets.all(25),
                          child: Text('About Us',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))),
                    ),
                    SizedBox(height: 10),
                    Text('Developed by\n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 2,
                            wordSpacing: 2)),
                    Text('Daniel Mark Florencio\nMikaela Mae Herrera',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 2,
                          wordSpacing: 2,
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
