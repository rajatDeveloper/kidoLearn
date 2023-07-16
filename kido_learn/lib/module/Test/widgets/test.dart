import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartingScreen(),
    );
  }
}

class StartingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starting Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Enter Your Name'),
                  content: TextField(
                    decoration: InputDecoration(
                      hintText: 'Your Name',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform any action with the entered value
                        Navigator.of(context).pop();
                      },
                      child: Text('Submit'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Open Dialog Box'),
        ),
      ),
    );
  }
}
