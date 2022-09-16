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

class JavascriptNavPage extends StatefulWidget {
  @override
  _JavascriptNavPageState createState() => _JavascriptNavPageState();
}

class _JavascriptNavPageState extends State<JavascriptNavPage> {
  static final expanded_text2 = '''
// program for a simple calculator
let result;

// take the operator input
const operator = prompt('Enter operator ( either +, -, * or / ): ');

// take the operand input
const number1 = parseFloat(prompt('Enter first number: '));
const number2 = parseFloat(prompt('Enter second number: '));

switch(operator) {
    case '+':
         result = number1 + number2;
        console.log(`\${number1} + \${number2} = \${result}`);
        break;

    case '-':
         result = number1 - number2;
        console.log(`\${number1} - \${number2} = \${result}`);
        break;

    case '*':
         result = number1 * number2;
        console.log(`\${number1} * \${number2} = \${result}`);
        break;

    case '/':
         result = number1 / number2;
        console.log(`\${number1} / \${number2} = \${result}`);
        break;

    default:
        console.log('Invalid operator');
        break;
}
''';

  static final expanded_text = '''
// program to shuffle the deck of cards

// declare card elements
const suits = ["Spades", "Diamonds", "Club", "Heart"];
const values = [
  "Ace",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "Jack",
  "Queen",
  "King",
];

// empty array to contain cards
let deck = [];

// create a deck of cards
for (let i = 0; i < suits.length; i++) {
    for (let x = 0; x < values.length; x++) {
        let card = { Value: values[x], Suit: suits[i] };
        deck.push(card);
    }
}

// shuffle the cards
for (let i = deck.length - 1; i > 0; i--) {
    let j = Math.floor(Math.random() * i);
    let temp = deck[i];
    deck[i] = deck[j];
    deck[j] = temp;
}

console.log('The first five cards are:');

// display 5 results
for (let i = 0; i < 5; i++) {
    console.log(`\${deck[i].Value} of \${deck[i].Suit}`)
}
''';

  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();

    const url = 'https://www.youtube.com/watch?v=W6NZfCO5SIk';

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
    const url = 'https://www.javascript.com/';
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
            title: Text(' JavaScript Programming'),
          ),
          body: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              children: <Widget>[
                SizedBox(height: 10),
                Text('JavaScript Programming',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold)),
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
                      '''JavaScript is one of the most popular programming languages of our generation and along with HTML and CSS are a must learn for aspiring web developers. \n\nJavaScript is a text-based programming language used both on the client-side and server-side that allows you to make web pages interactive. Where HTML and CSS are languages that give structure and style to web pages, JavaScript gives web pages interactive elements that engage a user.''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize:20,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
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
Why learn JavaScript  
1. Its the most popular programming language according to Stackoverflow.com          
2. Widely used in every browser
3. Has applications outside of the internet
4. Easy to learn
5. Provides eye-catching visual effects
6. Versatile
7. High Career potential
''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    'Like what was mentioned above, Javascript is primarily used alongside HTML code (CSS for styling) so in our tutorial you would often see HTML code.\n\n\nBASIC SYNTAX FOR HTML: ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 10),
                Image.asset('images/Samples/BasicHTML.jpg'),
                SizedBox(height: 10),
                Text(
                    'To insert JavaScript code inside HTML we have to use the <scripts> tag ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
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
                    'You also can download the JavaScipt manually to your computer',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("Download JavaScript SDK"),
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
                SizedBox(height: 20),
                Text('Output values in the console',
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
                  child:
                      Text('Using console.log to print values on our console',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            backgroundColor: Colors.transparent,
                          )),
                ),
                SizedBox(height: 10),
                Image.asset('images/Samples/console.jpg'),
                SizedBox(height: 20),
                Text('Using separate JavaScript code and HTML code',
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
                      'While, yes it is possible to create an application with the JavaScript code inside the script tags of an HTML code it is not recommended as it would make the code messy and harder to comprehend',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text('View on the HTML CODE with JavaScript script tag ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 10),
                Image.asset('images/Samples/seperate1.jpg'),
                SizedBox(height: 10),
                Text('View on the seperate JavaScript tag',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 10),
                Image.asset('images/Samples/seperate2.jpg'),
                SizedBox(height: 20),
                Text('Variables',
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
                      'Variables are what you can consider as data storages, they are able to hold all kinds of data with varying datatypes. \n\nTo use a variable, we will use the “let” keyword: ',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                Image.asset('images/Samples/variable.jpg'),
                SizedBox(height: 10),
                Text(
                    'Variables are what you can consider as data storages, they are able to hold all kinds of data with varying datatypes. \n\nTo use a variable, we will use the “let” keyword: \nRules to remember when creating a variable:  \n - Cannot start with a number, or contain a space or hypen(-)\n  - Is case sensitive\n - Should be meaningful\n\nWe can place values inside the variables such as Strings (“Sentences or Characters that can have spaces”), other Variables Constants (6,5,9.00) (number values), and boolean literals (true, false)\n\nLet name = “Mikaela”, age = 21, firstName = name; ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 20),
                Text('Objects',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Like Java JavaScript also uses Objects in its code and structure \n*Fun fact, despite the name JavaScript has nothing to do with Java, JS just decided to rename itself so it can ride on Java’s success at the start.\n Objects are generally what we use in programming to represent a real-life or made-up object, it can be anything: an apple, a book, or a dragon as long we can write out its attributes (characteristics) and methods (actions it can do) then its possible. ',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Image.asset('images/Samples/objectJS.jpg'),
                Text(
                    'We can use the attributes and methods of an object using the dot notation and bracket notation\n\n 1) Dot - object.foo = object.foo + 1;\n 2) Bracket - object["foo"] = object["foo"] + 1;',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 20),
                Text('Arithmetic Operators',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
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
                      'Arithmetic operators are used to perform different mathematical operations.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      ' Addition (+)\n Subtraction (-)\n Multiplication (*)\n Division (/)\n Modulus (%)\n Exponentiation (**)\n Floor Division (//)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1.5,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text('Comparison Operators',
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
                      'Comparison operators compare two values and indicate the difference between them. They return either a True or False value',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      ' Equal (==)\n Not Equal (!=)\n Greater Than (>)\n Less Than (<)\n Greater Than or Equal (>=)\n Less Than or Equal (<=)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text('Logical Operators',
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
                      'Logical operators are used to combine conditional statements.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'AND Operator (&&) - this operator checks if both statements are true. (TRUE && TRUE) \n\nOR Operator (||) - this operator checks if only one of the statements is true. (FALSE || TRUE)\n\nNOT Operator (!) - this operator returns the opposite of whatever the current values is. (!FALSE)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
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
                        fontSize: 17,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'IF statement - this is used for decision-making operations. \n\nELSE statement - this provides an alternative solution in case both the IF and ELIF are False.\n\nELIF statement - short for else if, this gives an alternate condition so that the code can have another chance to run.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
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
                    label: Text("JavaScript Online Compiler"),
                    onPressed: () {
                      const python_gdb = 'https://js.do/';

                      launch(python_gdb);
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
                buildCard(' SHUFFLE A DECK OF CARDS', ""),
                buildCard2(
                  ' SIMPLE CALCULATOR',
                ),
                SizedBox(height: 20),
                Text('JavaScript Online Courses',
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
                      //border: Border.all(color: Colors.blue, width: 2),
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
                          // letterSpacing: 1,

                          backgroundColor: Colors.transparent,
                        ),
                        text: "Coursera\n"),
                    TextSpan(
                        style: TextStyle(
                          color: Colors.blue, fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontFamily: 'Poppins',
                          // letterSpacing: 1,
                          backgroundColor: Colors.transparent,
                        ),
                        text: "1. JavaScript Security Specialization\n",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            final String course =
                                "https://www.coursera.org/specializations/javascript-security";
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
                            "2. Web Design for Everybody: Basics of Web Development & Coding Specialization\n",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            final String course2 =
                                "https://www.coursera.org/specializations/web-design";
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
                            "3. HTML, CSS, and Javascript for Web Developers\n",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            final String course3 =
                                "https://www.coursera.org/learn/html-css-javascript-for-web-developers";
                            launch(course3);
                          }),
                  ])),
                ),
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
