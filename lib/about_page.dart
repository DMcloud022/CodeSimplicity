import 'package:flutter/material.dart';

import 'home_page.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Colors.indigoAccent.shade700,
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          Container(
              height: 1800,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40),
                    Image.asset('images/banner.jpg'),
                    SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: 200,
                                  color: Color.fromARGB(183, 17, 13, 10),
                                  child: Text("What is Code Simplicity?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ))),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 370,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 224, 224, 224),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 22, 1, 43),
                                        offset: Offset(4.0, 4.0),
                                        blurRadius: 15.0,
                                        spreadRadius: 1.0,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-4.0, -4.0),
                                        blurRadius: 15.0,
                                        spreadRadius: 1.0,
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    'The purpose of Code Simplicity is to give the user an insight into the fundamentals of different programming languages that we are using right now.\n\nThis will give the students and professionals an overview of how a programming language works, its structure, purpose,\n\nAnd sample source code that will help the user of this application have a better understanding of the specific language that he/she wants to learn or study.',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      backgroundColor: Colors.transparent,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Container(
                                  padding: const EdgeInsets.all(20.0),
                                  width: 180,
                                  color: Color.fromARGB(255, 59, 194, 153),
                                  child: Text("Features",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ))),
                              new Container(
                                  padding: const EdgeInsets.all(20.0),
                                  width: 180,
                                  color: Color.fromARGB(255, 94, 102, 226),
                                  child: Text("Functionalities",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ))),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Container(
                                  padding: const EdgeInsets.all(20.0),
                                  width: 180,
                                  color: Color.fromARGB(255, 59, 194, 153),
                                  child: Text(
                                      "1. High Value Content\n2. Interactive Content\n3. Offline Mode\n4. User Friendly\n5.Good for beginners\n6.Accessible",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ))),
                              new Container(
                                  padding: const EdgeInsets.all(20.0),
                                  width: 180,
                                  color: Color.fromARGB(255, 94, 102, 226),
                                  child: Text(
                                      "1. Menu\n2. Search\n3. Categories\n\n\n\n\n\n",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ))),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text('Our Vision',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 25, 8, 177),
                                backgroundColor: Colors.transparent,
                              )),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 94, 102, 226),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                                border: Border.all(
                                    color: Color.fromARGB(255, 59, 66, 165),
                                    width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.all(20),
                            child: Text(
                                'The Vision of Code Simplicity is To become a global leader when it comes to delivering cost-effective yet efficient programming lessons to our students through our own modules and the lessons provided to us by our affiliates.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 1,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  backgroundColor: Colors.transparent,
                                )),
                          ),
                          SizedBox(height: 20),
                          Text('Our Mission',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 1, 46, 48),
                                backgroundColor: Colors.transparent,
                              )),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 31, 192, 165),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                                border: Border.all(
                                    color: Color.fromARGB(255, 59, 194, 153),
                                    width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.all(20),
                            child: Text(
                                '''To empower our users digitally and help them gain a competitive edge in this society by giving them comprehensive yet simple lessons in Java, JavaScript, Python, C++, and Dart programming languages 

With this mission, we aim to help our users:

1. Realize their potential when it comes to creating all sorts of programs and solving real-life issues using technology 
2. Enhance their skillset and profitability in today's society 
3. Solve complex issues to aid them to stand out from their competitors. 
''',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 1,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  backgroundColor: Colors.transparent,
                                )),
                          ),
                        ],
                      ),
                    )
                  ]))
        ])));
  }
}
