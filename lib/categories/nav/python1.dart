import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../search.dart';

class StatelessWidget {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class PythonNavPage extends StatefulWidget {
  @override
  _PythonNavPageState createState() => _PythonNavPageState();
}

class _PythonNavPageState extends State<PythonNavPage> {
  late YoutubePlayerController controller;
  static final expanded_text2 = '''
# Variables
INTEREST_RATE = 4.99
is_term_valid = False
is_qualified = False
interest = 0
total_payable_amount = 0
monthly_payment = 0
monthly_income = 0

# User Input
citizenship = input("Citizenship: ")
annual_income = float(input("Annual Income: "))
amount_to_borrow = float(input("Amount to Borrow: "))
term_in_years = int(input("Terms in Years: "))

# Conditions
if term_in_years >= 1 and term_in_years <= 5:
    is_term_valid = True
    # Interest
    interest = amount_to_borrow * (INTEREST_RATE / 100) * term_in_years

    total_payable_amount = amount_to_borrow + interest

    monthly_payment = total_payable_amount / (term_in_years * 12)
    monthly_income = annual_income / 12

    if citizenship.lower() == "filipino" and (monthly_income / 2) >= monthly_payment:
        is_qualified = True

# Displaying Output / Print
if not is_term_valid:
    print("The term is invalid. It must be within 1 to 5 years only.")

elif not is_qualified:
    print("You are not qualified.")
else:
    print("SUMMARY")
    print("Duration: " +str(term_in_years) + "years.")
    print("Interest: " + "{0:.2f}".format(interest) + "PHP")
    print("Total Payable Amount: " + "{0:.2f}".format(total_payable_amount) + "PHP")
    print("Monthly Payment: " + "{0:.2f}".format(monthly_payment) + "PHP")
''';

  static final expanded_text = '''
# This function adds two numbers
def add(x, y):
    return x + y

# This function subtracts two numbers
def subtract(x, y):
    return x - y

# This function multiplies two numbers
def multiply(x, y):
    return x * y

# This function divides two numbers
def divide(x, y):
    return x / y


print("Select operation.")
print("1.Addition")
print("2.Subtractractio")
print("3.Multipliplication")
print("4.Division")

while True:
    # take input from the user
    choice = input("Enter choice(1/2/3/4): ")

    # check if choice is one of the four options
    if choice in ('1', '2', '3', '4'):
        num1 = float(input("Enter first number: "))
        num2 = float(input("Enter second number: "))

        if choice == '1':
            print(num1, "+", num2, "=", add(num1, num2))

        elif choice == '2':
            print(num1, "-", num2, "=", subtract(num1, num2))

        elif choice == '3':
            print(num1, "*", num2, "=", multiply(num1, num2))

        elif choice == '4':
            print(num1, "/", num2, "=", divide(num1, num2))
        
        # check if user wants another calculation
        # break the while loop if answer is no
        next_calculation = input("Do you want to solve another problem? (yes/no): ")
        if next_calculation == "no":
          break
    
    else:
        print("Invalid Input")
''';
  @override
  void initState() {
    super.initState();

    const url = 'https://www.youtube.com/watch?v=Y8Tko2YC5hA';

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

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (context, player) => Scaffold(
          appBar: AppBar(
            title: Text(' Python Programming'),
            backgroundColor: Colors.indigoAccent.shade700,
          ),
          body: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              children: <Widget>[
                Image.asset(
                  'images/Welcome2.jpg',
                  width: 500,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text('Python Programming',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Poppins',
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Python is a high-level, general-purpose and a very popular programming language. Python programming language (latest Python 3) is being used in web development, Machine Learning applications, along with all cutting edge technology in Software Industry.\n\nPython Programming Language is very well suited for Beginners, also for experienced programmers with other programming languages like C++ and Java. ',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        letterSpacing: .5,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 25),
                Text('The Developer',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold)),
                Container(
                  child: Image.network(
                    'https://www.tfir.io/wp-content/uploads/2019/05/Python.jpg',
                    width: 150,
                    height: 210,
                    alignment: Alignment.center,
                    // fit: BoxFit.cover,
                  ),
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
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      '- Born on January 31, 1956\n\n- Guido van Rossum is a noted Dutch computer programmer and author, better known for creating the ‘Python’ programming language that earned him the title of the "Benevolent Dictator for Life" (BDFL).\n\n- He worked at several research institutes, such as the Corporation for National Research Initiatives (CNRI), the US National Institute of Standards and Technology (NIST), and the Centrum Wiskunde & Informatica (CWI) in the Netherlands.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        //letterSpacing: 1,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 20),
                Container(
                  child: Image.network(
                    'https://www.technotification.com/wp-content/uploads/2017/05/Python-programming-for-hackers-compressed.jpg',
                    width: 150,
                    height: 180,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    // fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text('Why should you learn Python?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Poppins',
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Python is highly scalable and extensible. This flexibility of Python allows you to perform cross-language operations without any hassle.\n\nThe programming language comes with the choicest assortment of libraries that come in handy for development and Data Science tasks. It has NumPy, SciPy, Scikit-Learn, Matplotlib, Pandas, StatsModels, and so much more.\n\nPython has something for every need. It packs in plenty of options for data visualization.\n\nPython is not just a programming language, it can be used for scripting too! The feature that sets scripting languages apart from programming languages is that scripting languages don’t require any compilation; they are directly interpreted.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
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
                      Icons.download,
                      size: 22,
                    ),
                    label: Text("Python Installation"),
                    onPressed: () {
                      const python_install =
                          'https://www.python.org/downloads/';

                      launch(python_install);
                    }),
                SizedBox(height: 50),
                Text(
                  ' What is Python?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    letterSpacing: 1,
                    color: Colors.black,
                    backgroundColor: Colors.transparent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' by Programming with Mosh',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    backgroundColor: Colors.transparent,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                player,
                SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent.shade700,
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
                    Icons.play_arrow_sharp,
                    size: 22,
                  ),
                  label: Text("Play / Pause"),
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
                Text(' What is an IDE?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        fontFamily: 'Poppins',
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
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'An IDE, or Integrated Development Environment, enables programmers to consolidate the different aspects of writing a computer program.\n\nIDEs increase programmer productivity by combining common activities of writing software into a single application: editing source code, building executables, and debugging.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        letterSpacing: .5,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 20),
                Text(' PyCharm',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
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
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'PyCharm is an integrated development environment used specifically for the Python language developed by the Czech company JetBrains in 2010.\n\nPyCharm is one of the most popular Python IDEs. There is a multitude of reasons for this, including the fact that it is developed by JetBrains, the developer behind the popular IntelliJ IDEA IDE that is one of the big 3 of Java IDEs and the “smartest JavaScript IDE” WebStorm. ',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        letterSpacing: .5,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
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
                      Icons.download,
                      size: 22,
                    ),
                    label: Text("Download PyCharm"),
                    onPressed: () {
                      const pycharm_install =
                          'https://www.jetbrains.com/pycharm/download/#section=windows';

                      launch(pycharm_install);
                    }),
                SizedBox(height: 50),
                Text('Fundamentals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        letterSpacing: 1,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(' Variables',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
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
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Variables are used to save values into memory using a name that we assign.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text(' Data Types',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Data types are the different kinds of data that we can store in a variable. Unlike many other languages, Python does not place a strong emphasis on defining the data type of an object, which makes coding much simpler.\n\nThe three main data types:\n1. Numbers (Integer and Floating Point)\n2. Strings\n3. Booleans',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text(' INTEGER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      letterSpacing: 1,
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'The integer data type is comprised of all the positive and negative whole numbers.\n\nEx.\n  num1 = 40\n  print(num1)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text(' FLOATING POINT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      letterSpacing: 1,
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'Floating-point numbers, or floats, refer to positive and negative decimal numbers.\n\nEx.\n  num2 = 3.14\n  print(num2)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text(' STRING',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      letterSpacing: 1,
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'A string is a collection of characters closed within single, double or triple quotation marks.\n\nEx.\n  my_course = "Computer Science"\n  print(my_course)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: .5,
                        fontSize: 16,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text(' BOOLEAN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      letterSpacing: 1,
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
                      //border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'A boolean values is either True or False, just like the value of a conditional expression after it has been evaluated.\n\nEx.\n  is_cold = False\n  print("Is it cold today?",is_cold)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
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
                        fontFamily: 'Poppins',
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
                      '            NAME               OPERATOR\n           Addition       -        (+)\n      Subtraction       -        (-)\n   Multiplication       -        (*)\n            Division       -        (/)\n           Modulus       -        (%)\n Exponentiation       -        (**)\n   Floor Division       -        (//)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.5,
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
                  child: Text('''
Examples for Arithmetic Operators

#Addition Operator
print(30 + 25)

#Subtraction operator
print(662 - 520)

#Multiplication operator
print(120 * 24)

#Division operator
print(150 / 10)
print(int(10.333333333333334))

#Modulus operator (remainder)
print(150 % 12)

#Exponentiation operator
print(3 ** 3)

#Floor Division operator
print(36 // 8)
''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.5,
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text(' Comparison Operators',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
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
                      'Comparison operators compare two values and indicate the difference between them. They return either a True or False value.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
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
                  child: Text('''
            NAME                     OPERATOR
  Equal                           -      (==) 
  Not Equal                     -      (!=)
  Greater Than                -      (>) 
  Less Than                     -      (<)
  Greater Than or Equal   -     (>=)
  Less Than or Equal        -     (<=)
  ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.5,
                        fontFamily: 'Poppins',
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
                  child: Text('''
Examples for Comparison Operators

#Equal Operator
x = 20
y = 11
print(x == y)

#Not Equal Operator
x = 20
y = 11
print(x != y)

#Greater Than Operator
x = 20
y = 11
print(x > y)

#Less Than Operator
x = 20
y = 11
print(x < y)

#Greater than or equal to operator
x = 20
y = 11
print(x >= y)

#Less than or equal to operator
x = 20
y = 11
print(x <= y)

''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Poppins',
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
                      fontFamily: 'Poppins',
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
                        fontFamily: 'Poppins',
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
                        fontFamily: 'Poppins',
                        fontSize: 16.5,
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
                  child: Text('''
Examples for Logical Operators

#AND operator (both correct)
x = 57
print(x > 2 and x < 400)

#OR operator (one correct is true)
x = 57
print(x > 40 or x < 40)

#NOT operator (opposite of the answer)
x = 57
print(not(x > 2 and x < 400))
''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.5,
                        letterSpacing: 0.5,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 10),
                Text(' Coditional Statements',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
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
                      'A conditional statement is a Boolean expression that, if True, executes a piece of code.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
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
                      'IF statement - this is used for decision-making operations. \n\nELSE statement - this provides an alternative solution in case both the IF and ELIF are False.\n\nELIF statement - short for else if, this gives an alternate condition so that the code can have another chance to run.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.5,
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(height: 15),
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
                  child: Text('''
Examples for Conditional Statements

#IF statement
num1 = 10
if num1 >=0:
    print("1. It's a positive number")

#ELSE statement
x = 10
if x > 45:
    print("2. Yes")
else:
    print("2. No")

#ELIF statement
food_cost = 400
if food_cost > 400:
    print("3. I will not buy food.")
elif food_cost == 400:
    print("3. I will buy spaghetti.")
elif food_cost < 400:
    print("3. I will buy iced tea.")
''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.5,
                        letterSpacing: 0.5,
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
                    label: Text("Python Online Compiler"),
                    onPressed: () {
                      const python_gdb =
                          'https://www.onlinegdb.com/online_python_compiler';

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
                buildCard(
                  ' SIMPLE CALCULATOR',
                  'https://mindxmaster.s3.amazonaws.com/wp-content/uploads/2019/08/1_python-1-750x422.jpg',
                ),
                buildCard2(
                  ' LOAN PAYMENT CALCULATOR',
                ),
                SizedBox(height: 20),
                Text('Python Online Courses',
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
                        text: "1. Python for Everybody Specialization\n",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            final String course =
                                "https://www.coursera.org/specializations/python";
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
                            "2. Applied Data Science with Python Specialization\n",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            final String course2 =
                                "https://www.coursera.org/specializations/data-science-python";
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
                        text: "3. Python for Data Science, AI & Development\n",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            final String course3 =
                                "https://www.coursera.org/learn/python-for-applied-data-science-ai";
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
                Image.network(
                  urlImage,
                  height: 100,
                  width: 500,
                  fit: BoxFit.cover,
                ),
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
