import 'package:flutter/material.dart';
import 'package:spotify/screens/home.dart';
import 'package:spotify/screens/search.dart';
import 'package:spotify/screens/yourlibrary.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Tabs = [Home(), Search(), YourLibrary()];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Tabs[currentTabIndex],
    
      backgroundColor: Colors.black,
      bottomNavigationBar: new BottomNavigationBar(

        currentIndex: currentTabIndex,
        onTap: (currentIndex){
            print("The Current Index is $currentIndex");
            currentTabIndex = currentIndex;
            setState(() {
              
            });
        },

          backgroundColor: Colors.black45,
          selectedLabelStyle: TextStyle(color: Colors.white),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books,
                  color: Colors.white,
                ),
                label: "Library"),
          ]),
    );
  }
}
