import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';
import 'dart:js';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
    final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
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
            icon: new Icon(Icons.shopping_cart), 
            padding: EdgeInsets.only(right: 15.0), onPressed: () {},
          ),
                  ],
        ),
        SliverPersistentHeader(
          pinned: true, 
          delegate: _SliverAppBarDelegate(
            // child: searchField(),
            child: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: searchField(),
            )
          )
          
        ),
        SliverFixedExtentList(
          itemExtent: 150.0, 
          delegate: SliverChildListDelegate(
            [
            Container(color: Colors.red),
            Container(color: Colors.purple),
            Container(color: Colors.green),
            Container(color: Colors.orange),
            Container(color: Colors.yellow),
            Container(color: Colors.pink),
            ]
          )
        )
      ],
    )
    );
  }
}

Widget searchField(){
  return Container(
    height: 50.0,
    color: colorBlue,
    padding: EdgeInsets.fromLTRB(15.0,10.0,15.0,10.0),
    child: TextField(
      decoration: InputDecoration(
      hintText: "Search Courses",
      contentPadding: EdgeInsets.all(8.0),
      prefixIcon: Icon(Icons.search, color: colorGrey),
      fillColor: Colors.white,
      filled: true,
      enabled: false,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        borderSide: BorderSide.none,
      ),
      ),
    ), 
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({ this.child });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }

}