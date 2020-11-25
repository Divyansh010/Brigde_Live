import 'package:BridgeLive/CoursesPage.dart';
import 'package:BridgeLive/HomePage.dart';
import 'package:BridgeLive/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MorePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: colorOrange));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: bgColor ),
            home: MyBottomNavBar()
    );
  }
}

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

   int _currentIndex =0;   //track currently selected Tab
  final List<Widget> _children=[
    HomePage(),
    CoursesPage(),
    MorePage(),
  ];  
   void onTabTapped(int index){
    setState(() {
            _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home_outlined),
          label: 'Home', 
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.article_outlined),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.menu),
          label: 'More',
        )
      ],
    ),
    );
  }
}