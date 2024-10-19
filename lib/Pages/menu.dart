import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:theta/Pages/search.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set the navbar background color to black
        title: Row(
          children: [
            Image.asset(
              'assets/Logo_with_black_underlay.png', // Path to your logo image
              height: 40, // Adjust the height as needed
            ),
            SizedBox(width: 10), // Adds space between the logo and the text
            Text(
              'Theta',
              style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
                fontSize: 20, // Adjust the text size as needed
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set the text color to white
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Big Header for Menu
            Text(
              'NAVIGATION',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w300, // Large font size for the header
                color: Colors.black, // Color for the header text
              ),
            ),
            SizedBox(height: 190), // Space between the header and the buttons

            // History button (smaller button)
            ElevatedButton(
              onPressed: () {
                // Add your logic for the History button here
              },
              child: Text(
                'History',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 16, // Adjust the text size as needed
                ),
              ),
            ),
            SizedBox(height: 30), // Space between the buttons

            // Start Drive button (larger button)
            ElevatedButton(
              onPressed: () {
                // Navigate to the SearchPage with a smooth transition
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => SearchPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 90), // Adjust the size here
                textStyle: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 18, // Adjust the text size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Start Drive'),
            ),
          ],
        ),
      ),
    );
  }
}
