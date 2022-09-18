import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../search.dart';
import 'dart:io';

class StatelessWidget {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class DartNavPage extends StatefulWidget {
  @override
  _DartNavPageState createState() => _DartNavPageState();
}

class _DartNavPageState extends State<DartNavPage> {
  static final expanded_text2 = '''
import 'dart:convert';
import 'dart:io';
import 'dart:math';

class Calc {
  // instance fiels
  double num1;
  double num2;

  // constructor
  Calc(double firstNum, double secondNum) {
    this.num1 = firstNum;
    this.num2 = secondNum;
  }

  //class method
  //class methods
  double add(double firstNum, double secondNum) {
    return firstNum + secondNum;
  }

  double subtract(double firstNum, double secondNum) {
    return firstNum - secondNum;
  }

  double multiply(double firstNum, double secondNum) {
    return firstNum * secondNum;
  }

  double expontentiate(double firstNum, double secondNum) {
    // Math.pow returns a double, so use typecasting to account for large numbers

    double exponentProd = pow(firstNum, secondNum);

    return exponentProd;
  }

  double divide(double firstNum, double secondNum) {
    return firstNum / secondNum;
  }

  static void backToMainMenu() {
    print("\nReturning to main menu...\n");
    wholeThing();
  }

  static void wholeThing() {
    // TODO : adding a Delay

    print("""
        \nWelcome to the Dart Calculator!
        \n=============================== 
        \nThis calculator performs operations on two numbers. 
        \nPlease type your first number \nType 'exit' to exit at anytime! \n""");

    String firstInput =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    firstInput = firstInput.trim();
    double firstNum = 0.0;

    if (firstInput == "exit") {
      exit(0);
    } else {
      firstNum = double.parse(firstInput);
    }

    print("\nGreat! Now input your second number.\n");

    String secondInput =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    secondInput = secondInput.trim();
    double secondNum = 0.0;

    if (secondInput == "exit") {
      exit(0);
    } else {
      secondNum = double.parse(secondInput);
    }

    Calc calc1 = new Calc(firstNum, secondNum);

    print("""\nAwesome! Now, choose the operation you want.
    \nType + for addition
    \nType - for subtraction
    \nType * for multiplication
    \nType ** to raise the first number to the power of the second
    \nType / to divide""");

    String operator = stdin.readLineSync(encoding: Encoding.getByName("utf-8"));
    operator = operator.trim();

    switch (operator) {
      case "+":
        print("\${calc1.num1} plus \${calc1.num2} equals = \${calc1.add(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "-":
        print("\${calc1.num1} minus \${calc1.num2} equals = \${calc1.subtract(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "*":
        print("\${calc1.num1} multiplied by \${calc1.num2} equals = \${calc1.multiply(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "**":
        print("\${calc1.num1} raised to the power of \${calc1.num2} equals = \${calc1.expontentiate(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "/":
        print("\${calc1.num1} divided by \${calc1.num2} equals = \${calc1.divide(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "exit":
        exit(0);
        break;
      default:
        print("Input not recognized.");
        backToMainMenu();
        break;
    }
  }
}
''';

  static final expanded_text = '''
import 'dart:math';

void main() {
  print("Using Random()");
  Random r1 = new Random();
  print(r1.nextInt(100));
  print(r1.nextBool());
  print(r1.nextDouble());

  print("\nUsing Random.secure() :");
  Random r2 = new Random.secure();
  print(r2.nextInt(100));
  print(r2.nextBool());
  print(r2.nextDouble());
}
''';

  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();

    const url = 'https://www.youtube.com/watch?v=Ej_Pcr4uC2Q';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void deactivate() {
    controller.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  _launchURLSDK() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (context, player) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigoAccent.shade700,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => search()));
                },
                icon: Icon(Icons.search),
              )
            ],
            centerTitle: true,
            title: Text(' Dart Programming'),
          ),
          body: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              children: <Widget>[
                SizedBox(height: 10),
                Text('Dart Programming',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      ''''Dart is a programming language designed for client development, such as for the web and mobile apps. It is developed by Google and can also be used to build server and desktop applications. It is an object-oriented, class-based, garbage-collected language with C-style syntax
                      ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(''''Reasons to learn Dart programming: 

1. Dart embraced the open source ecosystem
2. Dart is pretty easy to learn
3. Dart is a good first language
4. Dart has great tooling support
5. Dart is a robust language
6. Dart ensures productivity
7. Dart is used by Flutter
8. Dart is backed by a tech giant
9. Dart solved a lot of problems, efficiently
10. Dart is really flexible
                      
                      ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 25),
                player,
                SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('Play / Pause'),
                  onPressed: () {
                    //controller.toggleFullScreenMode();
                    if (controller.value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  },
                ),
                SizedBox(height: 20),
                Text(
                    'You also can download the DART SDK manually to your computer',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("Download DART SDK"),
                  onPressed: _launchURLSDK,
                ),
                SizedBox(height: 10),
                Text('Fundamentals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Output data',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text('''
To output data in dart, we can use the print command, we can simply enter a variable or string literal inside in order for it to appear in our command line. 

Sample: 

print('Hello');
print(11); 
''',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 20),
                Text('Data Types',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'In the above topic, we mentioned variables. Each variable is able to contain different kinds of data, those different kinds of data is what we consider as “Data types”. Here are the different kinds of Data types in Dart',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Image.asset('images/Samples/DataTypes_Dart.jpg'),
                SizedBox(height: 10),
                Image.asset('images/Samples/data_types_1.png'),
                Image.asset('images/Samples/data_types_2.png'),
                SizedBox(height: 20),
                Text(' Arithmetic Operators',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Arithmetic operators are used to perform different mathematical operations.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      ' Addition (+)\n Subtraction (-)\n Multiplication (*)\n Division (/)\n Modulus (%)\n Exponentiation (**)\n Floor Division (//)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.5,
                        letterSpacing: 1.5,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text(' Comparison Operators',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Comparison operators compare two values and indicate the difference between them. They return either a True or False value',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        //letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      ' Equal (==)\n Not Equal (!=)\n Greater Than (>)\n Less Than (<)\n Greater Than or Equal (>=)\n Less Than or Equal (<=)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.5,
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text(' Logical Operators',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Logical operators are used to combine conditional statements.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'AND Operator - this operator checks if both statements are true. \n\nOR Operator - this operator checks if only one of the statements is true.\n\nNOT Operator - this operator returns the opposite of whatever the current values is.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.5,
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text('Coditional Statements',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'A conditional statement is a Boolean expression that, if True, executes a piece of code.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'IF statement - this is used for decision-making operations. \n\nELSE statement - this provides an alternative solution in case both the IF and ELIF are False.\n\nELIF statement - short for else if, this gives an alternate condition so that the code can have another chance to run.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.5,
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 20),
                Text('Methods and Classes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      ''''Dart is similar to Java in the way that they handle classes and Functions. 

Classes are the code equivalent of real life objects, we make those objects inside our program by using classes as their blueprint                      
As long as you're aware of what you want your object to be and how they should act, you can create any type of object in Dart
                      
Methods on the other hand are the actions that those objects can do, they are similar to Functions in that way. 
They are often categorized by their data return type and parameters. 
                      ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                Image.asset('images/Samples/class_dart.jpg'),
                SizedBox(height: 20),
                Text('Flutter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text('''
Dart is a unique programming language where its primarily used with Flutter so you would often see it associated with each of the Flutter application's widgets. 

Of course, Dart isn't ONLY used with Flutter and is usuble for other applications but it is an integral part to Dart's identity. 

If you wish to learn more about flutter follow the link below: 
''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 15),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 19, 3, 29),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // maximumSize: Size(90, 80),
                      elevation: 10,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                      textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    icon: Icon(
                      Icons.u_turn_left,
                      size: 22,
                    ),
                    label: Text("Learn more about Flutter"),
                    onPressed: () {
                      const more_flutter = 'https://flutter.dev/';
                      launch(more_flutter);
                    }),
                SizedBox(height: 20),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // maximumSize: Size(90, 80),
                      elevation: 10,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                      textStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    icon: Icon(
                      Icons.web,
                      size: 22,
                    ),
                    label: Text("Dart Online Compiler"),
                    onPressed: () {
                      const dart_pad = 'https://dartpad.dev/?';

                      launch(dart_pad);
                    }),
                SizedBox(height: 20),
                Text('Sample Source Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.bold,
                    )),
                buildCard(
                    ' CREATE A RANDOM INTEGER, DOUBLE OR A BOOLEAN IN DART USING RANDOM CLASS',
                    ""),
                buildCard2(
                  ' SIMPLE CALCULATOR',
                ),
                SizedBox(height: 20),
                Text('Dart Online Courses',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(30),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: 'Poppins',
                            backgroundColor: Colors.transparent,
                          ),
                          text: "Coursera\n"),
                      TextSpan(
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: 'Poppins',
                            backgroundColor: Colors.transparent,
                          ),
                          text: "1. Introduction to Dart\n",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              final String course =
                                  "https://www.coursera.org/projects/googlecloud-introduction-to-dart-z35cr";
                              launch(course);
                            }),
                      TextSpan(
                          style: TextStyle(
                            color: Colors.blue, fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: 'Poppins',
                            // letterSpacing: 1,
                            backgroundColor: Colors.transparent,
                          ),
                          text:
                              "2. Dart: Variables, Data Structures, Objects, and Conditionals\n",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              final String course2 =
                                  "https://www.coursera.org/projects/googlecloud-dart-variables-data-structures-objects-and-conditionals-f5y74";
                              launch(course2);
                            }),
                      TextSpan(
                          style: TextStyle(
                            color: Colors.blue, fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: 'Poppins',
                            // letterSpacing: 1,
                            backgroundColor: Colors.transparent,
                          ),
                          text:
                              "3. Dart: Using Functions with Lists and Maps\n",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              final String course3 =
                                  "https://www.coursera.org/projects/googlecloud-dart-using-functions-with-lists-and-maps-lpiu9";
                              launch(course3);
                            }),
                    ]))),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
      );

  Widget buildCard(String title, String urlImage) => Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          constraints: BoxConstraints.tightForFinite(width: 50),
          decoration: BoxDecoration(
              color: Colors.grey[300],
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
              //border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                ExpandablePanel(
                  theme: ExpandableThemeData(
                    expandIcon: Icons.arrow_downward,
                    collapseIcon: Icons.arrow_upward,
                    tapBodyToCollapse: true,
                    tapBodyToExpand: true,
                  ),
                  header: Text(
                    title,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  collapsed: Text(
                    expanded_text,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      fontFamily: 'Poppins',
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    List.generate(1, (_) => expanded_text).join('\n\n'),
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  builder: (_, collapsed, expanded) => Padding(
                    padding: const EdgeInsets.all(10.0).copyWith(top: 0),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildCard2(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          constraints: BoxConstraints.tightForFinite(width: 50),
          decoration: BoxDecoration(
              color: Colors.grey[300],
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
              //border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Card(
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Text(
                title,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                ),
              ),
              collapsed: Text(
                expanded_text2,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => expanded_text2).join('\n\n'),
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                ),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10.0).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );
}
