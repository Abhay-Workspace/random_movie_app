import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  const Credits({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Dare'),
        backgroundColor: Color(0xFF1f2836),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
        child: Column(
          children: [
            Container(
              height: 500,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 50.0,
                    spreadRadius: 5,
                    offset: Offset(5, 0),
                  ),
                ],
                // borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('lib/assets/tmdb_logo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'This product uses the TMDb API but is not endorsed or certified by TMDb.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
