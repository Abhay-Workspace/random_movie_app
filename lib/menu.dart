import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'movie_list.dart';
import 'movie_page.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1f2836),
      child: Container(
        // alignment: Alignment.topCenter,
        // margin: EdgeInsets.all(10),
        // padding: EdgeInsets.only(top: 20, bottom: 40, right: 10),
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        color: Color(0xFF1f2836),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return new MoviePage();
            }));
          },
          child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
