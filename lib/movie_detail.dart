import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MovieDetail extends StatelessWidget {
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  var myList = ['a', 'b'];
  MovieDetail(this.movie);
  Color mainColor = const Color(0xff3C3261);
  final List<String> entries = <String>['ABCDE', 'B', 'C', 'D', 'E', 'F', 'G'];
  final List<int> colorCodes = <int>[
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100
  ];

  var keyMap = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western",
    10759: "Action & Adventure",
    10762: "Kids",
    10763: "News",
    10764: "Reality",
    10765: "Sci-Fi & Fantasy",
    10766: "Soap",
    10767: "Talk",
    10768: "War & Politics",
  };

  @override
  Widget build(BuildContext context) {
    try {
      return new Container(
        color: Color.fromRGBO(255, 255, 255, 0.19),
        child: new Stack(fit: StackFit.expand, children: [
          new Image.network(
            image_url + movie['poster_path'],
            fit: BoxFit.cover,
          ),
          new BackdropFilter(
            // filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            filter: ui.ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: new Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          new SingleChildScrollView(
            child: new Container(
              margin: const EdgeInsets.all(20.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    alignment: Alignment.center,
                    child: new Container(
                      width: 400.0,
                      height: 400.0,
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        image: new DecorationImage(
                          image: new NetworkImage(
                              image_url + movie['poster_path']),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black,
                              blurRadius: 100.0,
                              offset: new Offset(10.0, 20.0))
                        ]),
                  ),
                  new Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 0.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie['title'] == null
                                    ? movie['name']
                                    : movie['title'],
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontFamily: 'Arvo',
                                ),
                              ),
                              Text(
                                movie['release_date'] != null
                                    ? 'Release Date: ${movie['release_date']}'
                                    : movie['first_air_date'] == null
                                        ? ''
                                        : 'Air Date: ${movie['first_air_date']}',
                                style: new TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15.0,
                                  fontFamily: 'Arvo',
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Text(
                          '${movie['vote_average']}/10',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Arvo',
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(2),
                      itemCount: movie['genre_ids'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          padding: EdgeInsets.all(6),
                          color: Colors.blue[colorCodes[index]],
                          child: Center(
                            child: Text(
                              '${keyMap[movie['genre_ids'][index]]}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Container(
                    child: new Text(
                      movie['overview'],
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'Arvo',
                        // fontSize: 15,
                      ),
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0)),
                ],
              ),
            ),
          )
        ]),
      );
    } catch (e) {
      // print(e);
      return Container(
        alignment: Alignment.center,
        child: Text(
          'Something went wrong! I had told you to buy my developer a coffee :/',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
