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

class JavaNavPage extends StatefulWidget {
  @override
  _JavaNavPageState createState() => _JavaNavPageState();
}

class _JavaNavPageState extends State<JavaNavPage> {
  static final expanded_text2 = '''
import java.util.Scanner;

class Main {
  public static void main(String[] args) {

    char operator;
    Double number1, number2, result;

    // create an object of Scanner class
    Scanner input = new Scanner(System.in);

    // ask users to enter operator
    System.out.println("Choose an operator: +, -, *, or /");
    operator = input.next().charAt(0);

    // ask users to enter numbers
    System.out.println("Enter first number");
    number1 = input.nextDouble();

    System.out.println("Enter second number");
    number2 = input.nextDouble();

    switch (operator) {

      // performs addition between numbers
      case '+':
        result = number1 + number2;
        System.out.println(number1 + " + " + number2 + " = " + result);
        break;

      // performs subtraction between numbers
      case '-':
        result = number1 - number2;
        System.out.println(number1 + " - " + number2 + " = " + result);
        break;

      // performs multiplication between numbers
      case '*':
        result = number1 * number2;
        System.out.println(number1 + " * " + number2 + " = " + result);
        break;

      // performs division between numbers
      case '/':
        result = number1 / number2;
        System.out.println(number1 + " / " + number2 + " = " + result);
        break;

      default:
        System.out.println("Invalid operator!");
        break;
    }

    input.close();
  }
}
''';

  static final expanded_text = '''
public class PermuteString {    
    //Function for swapping the characters at position I with character at position j    
    public static String swapString(String a, int i, int j) {    
        char[] b =a.toCharArray();    
        char ch;    
        ch = b[i];    
        b[i] = b[j];    
        b[j] = ch;    
        return String.valueOf(b);    
    }    
        
    public static void main(String[] args)    
    {    
        String str = "ABC";    
        int len = str.length();    
        System.out.println("All the permutations of the string are: ");    
        generatePermutation(str, 0, len);    
    }    
        
    //Function for generating different permutations of the string    
    public static void generatePermutation(String str, int start, int end)    
    {    
        //Prints the permutations    
        if (start == end-1)    
            System.out.println(str);    
        else    
        {    
            for (int i = start; i < end; i++)    
            {    
                //Swapping the string by fixing a character    
                str = swapString(str,start,i);    
                //Recursively calling function generatePermutation() for rest of the characters     
                generatePermutation(str,start+1,end);    
                //Backtracking and swapping the characters again.    
                str = swapString(str,start,i);    
            }    
        }    
    }    
}    
''';

  int pressedButtonNo = 0;

  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();

    const url = 'https://www.youtube.com/watch?v=eIrMbAQSU34';

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
    const url = 'https://www.oracle.com/java/technologies/downloads/';
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
            title: Text('Java'),
          ),
          body: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              children: <Widget>[
                SizedBox(height: 10),
                Text('Java Programming',
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
                      '''Java is one of the most popular programming language of our generation, it is mainly used for\n\n- Mobile application\n\n- Desktop application\n\n- Web applications\n\n- Games\n\n- Database
                      ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
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
                  child: Text('''Why should we use Java:

1. Java works on different platforms 
2. It is one of the most popular programming language in the world
3. It is easy to learn and simple to use
4. It is open-source and free
5. It is secure, fast and powerful
6. It has a huge community support 
7. Java is an object oriented language
8. As Java is close to C++ and C#, it makes it easy for programmers to switch to Java or vice versa
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
                Text('You also can download the Java manually to your computer',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("Download Java SDK"),
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
                  child: Text(
                      'In order to output data to the user\'s device in java, you\'ll have to use the:\n\n(1) System.out.println(); or\n\n(2) System.out.print();\n\nfor (1) It is the most used way to output, (2) Also outputs data but then the cursor moves to the beginning of the next line\n\n\nSample Syntax:\n\nclass Main {\npublic static void main(String[] args) {\nint x = 2;\nSystem.out.print(x);\nSystem.out.println(\'Literal String\");\nSystem.out.print(2);\n}}',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 20),
                Text('Input',
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
                      'To input data into a java program we primarily use the Scanner class\n\nThe scanner class has its own ready to use methods that allows the user to input data quickly and easily.\n\nTo input data, first import the Scanner class from the java.util package\n\nNext we would then create an instance of that scanner\n\nThen we can call that scanner and use its nextLine() or nextInt() functions to get data\n\n*NOTE: When you use nextInt() and are planning to use nextLine() afterwards don’t forget to place a nextLine() function without a variable after the nextInt() function to avoid errors.\n\nSample:\n\nImport java.util.Scanner; //The scanner import\nclass Main{\npublic static void main(String[] args) {\nScanner scName = new Scanner(System.in);  // Create a Scanner object\nSystem.out.println("Enter username");\n String name = scName.nextLine();  // uses the nextLine function to get string input\nint age = scName.nextInt();  // uses the nextLine function to get int input\nSystem.out.println(“Name is: " + name +” and Age is: “+age);  // Output user input\n}\n}',
                      textAlign: TextAlign.justify,
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
                      'In the above topic, we mentioned variables. Each variable is able to contain different kinds of data, those different kinds of data is what we consider as “Data types”\n\nJava data types has two main groups\nPrimitive data types such as byte, short, int, long, float, double, boolean, and char\nAnd Non-primitive data types such as String, Arrays, and Classes\nTo understand the primitive data types easier, think of it like this:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Image.asset('images/Samples/DataTypes_Java.jpg'),
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
                SizedBox(height: 10),
                Text('Classes and Objects',
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Java is an object oriented programming language meaning that the properties of a java application is primarily made up of different kinds of objects.\n\nIn other words in java application we always aim to create objects to use. One issue though is that code is virtual, applications are only used through a screen not in real life but the objects that we aim to create are actual things in the real world, so how do we transfer a physical object to a virtual world? \n\nThrough classes, classes are blueprints for objects that we want to use, they represent the objects through its class names, attributes (variables of a class) and methods (functions of a class)\n\nTo use our object blueprint (class) in our other classes or the main method we create an instance of that object, meaning we take that blueprint and then actually build an object using it. ',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text('Sample:  ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    )),
                Image.asset('images/Samples/java_class.jpg'),
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
                    label: Text("Java Online Compiler"),
                    onPressed: () {
                      const java_gdb =
                          'https://www.onlinegdb.com/online_java_compiler';

                      launch(java_gdb);
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
                buildCard(' PERMUTATION OF A STRING', ""),
                buildCard2(
                  ' SIMPLE CALCULATOR',
                ),
                SizedBox(height: 20),
                Text('Java Online Courses',
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
                          text:
                              "1. Object Oriented Programming in Java Specialization\n",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              final String course =
                                  "https://www.coursera.org/specializations/object-oriented-programming";
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
                              "2. Object Oriented Programming in Java Specialization\n",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              final String course2 =
                                  "https://www.coursera.org/specializations/pcdp";
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
                          text: "3. Introduction to Java\n",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              final String course3 =
                                  "https://www.coursera.org/learn/java-introduction";
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
