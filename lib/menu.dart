import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:circular_menu/circular_menu.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF1f2836),
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 20, bottom: 40, right: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            // color: Colors.orange[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  //height: MediaQuery.of(context).size.height / 5.0,
                  width: MediaQuery.of(context).size.width / 5.0,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.trending_up),
                        iconSize: MediaQuery.of(context).size.height / 25.0,
                        tooltip: 'Hot',
                        color: Colors.red,
                        onPressed: () {},
                      ),
                      Text(
                        'Hot',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  //height: MediaQuery.of(context).size.height / 5.0,
                  width: MediaQuery.of(context).size.width / 5.0,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        iconSize: MediaQuery.of(context).size.height / 25.0,
                        icon: Icon(Icons.movie),
                        color: Colors.blue,
                        tooltip: 'Popular',
                        onPressed: () {},
                      ),
                      Text(
                        'Popular',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  //height: MediaQuery.of(context).size.height / 5.0,
                  width: MediaQuery.of(context).size.width / 5.0,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.category),
                        iconSize: MediaQuery.of(context).size.height / 25.0,
                        color: Colors.green,
                        tooltip: 'Genre',
                        onPressed: () {},
                      ),
                      Text(
                        'Genre',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
