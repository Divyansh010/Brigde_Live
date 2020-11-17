import 'package:BridgeLive/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'placeholder_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex =0;   //track currently selected Tab
  final List<Widget> _children=[
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.green)
  ];   //list of widgets need to be rendered while selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        toolbarHeight: 120,
        backgroundColor: colorBlue,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Container(
            width: 380,
            padding: EdgeInsets.only(bottom: 20.0),
            child: searchField(),
          ),
          preferredSize: Size.square(50),
          ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 15.0),
          icon: SvgPicture.asset("assets/images/brigdelogo.svg"), onPressed: () {},
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.help_outline), onPressed: () {},
          ),
          new IconButton(
            icon: new Icon(Icons.shopping_cart), padding: EdgeInsets.only(right: 20.0), onPressed: () {},
          ),
                  ],
    ),
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

//This will trigger Build method with the state passed to it
  void onTabTapped(int index){
    setState(() {
    });
      _currentIndex=index;
  }
}

Widget searchField(){
  return Container(
    height: 40.0,
    padding: EdgeInsets.all(2.0),
    child: TextField(
      decoration: InputDecoration(
      hintText: "Search Courses",
      prefixIcon: Icon(Icons.search, color: colorGrey),
      fillColor: Colors.white,
      filled: true,
      enabled: false,
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))
      ),
    ),    
  );
}