import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {

  ScrollController _scrollViewController;

  @override
  void initState(){
    super.initState();
    _scrollViewController=new ScrollController();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Courses Page"),
      // ),
      // body: new Center(
      //   child: new Text("This is Courses Page")
      // ),
      body: new NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            new SliverAppBar(
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: colorBlue,
              elevation: 0.0,
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
            )
          ];
        },
        body: new TextField(
          decoration: InputDecoration(
      hintText: "Search Courses",
      prefixIcon: Icon(Icons.search, color: colorGrey),
      fillColor: Colors.white,
      filled: true,
      enabled: false,
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))
      ),
        )
        ),
    );
  }
}