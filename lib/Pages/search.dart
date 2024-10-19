import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
          child: Text(
            '<--',
            style: TextStyle(
              color: Colors.blue, // Set the text color to blue
              fontSize: 16, // Adjust the font size if needed
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: SizedBox.shrink(), // Removes the title space in the AppBar
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container for the logo
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/google.png', // Path to your logo image
              height: 100, // Adjust the height as needed
            ),
          ),
          SizedBox(height: 100), // Space between the logo and the TextField
          // TextField for search input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 50), // Space between the TextField and the Submit button
          // Submit button
          ElevatedButton(
            onPressed: () async {  // Make this method async
              String searchText = _searchController.text;
              String urlString = 'https://www.google.com/maps/search/$searchText';

              // Launch the URL
               final Uri url = Uri.parse(urlString);

              launchUrl(url);
            },
            child: Text('Submit'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Adjust the size here
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
