import 'package:flutter/material.dart';

class YourLibrary extends StatelessWidget {
  const YourLibrary({super.key});

  Widget createAppbar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      foregroundColor: Colors.white,
      title: Text(message),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.library_books),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blueGrey.shade300,
        Colors.black,
        Colors.black,
        Colors.black
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Column(
        children: [
          createAppbar("Your Library"),
        ],
      ),
    );
  }
}