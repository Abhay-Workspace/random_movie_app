import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'movie_detail.dart';
import 'Post.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math';

class MoviePage extends StatefulWidget {
  MoviePage({Key key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var movies;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  Color mainColor = const Color(0xff3C3261);

  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    Random random = new Random();
    var p = random.nextInt(10) + 1;
    var apiKey = '47bd72aae75bbb99a3a5baaff9a9a585';
    var url =
        'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&page=${p}';
    // String url = 'https://jsonplaceholder.typicode.com/posts';

    Future<Post> getPost() async {
      final response = await http.get('$url');
      return postFromJson(response.body);
    }

    // Size screenSize = MediaQuery.of(context).size;
    var image_url = 'https://image.tmdb.org/t/p/w500/';
    return Scaffold(
      body: Center(
        child: FutureBuilder<Post>(
          future: getPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return movieDetail(snapshot);
            else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget movieDetail(snapshot) {
    Random random = new Random();
    if (snapshot == null ||
        snapshot.data == null ||
        snapshot.data.results == null) {
      // setState(() {});
      return Text('Common dude! You are searching a lot!');
    }
    var i = random.nextInt(snapshot.data.results.length);
    var movie = snapshot.data.results[i];

    return Container(
      child: new Stack(fit: StackFit.expand, children: [
        new Image.network(
          image_url + movie.posterPath,
          fit: BoxFit.cover,
        ),
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            color: Colors.black.withOpacity(0.5),
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
                          image: new NetworkImage(image_url + movie.posterPath),
                          fit: BoxFit.cover),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            offset: new Offset(0.0, 10.0))
                      ]),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                        movie.title,
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'Arvo'),
                      )),
                      new Text(
                        '${movie.voteAverage}/10',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                new Text(movie.overview,
                    style:
                        new TextStyle(color: Colors.white, fontFamily: 'Arvo')),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Container(
                      width: 150.0,
                      height: 60.0,
                      alignment: Alignment.center,
                      child: new Text(
                        'Rate Movie',
                        style: new TextStyle(
                            color: Colors.white,
                            fontFamily: 'Arvo',
                            fontSize: 20.0),
                      ),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          color: const Color(0xaa3C3261)),
                    )),
                    new Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: new Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            color: const Color(0xaa3C3261)),
                      ),
                    ),
                    new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: new Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          ),
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: const Color(0xaa3C3261)),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

Future<Map> getJson() async {
  // var apiKey = getApiKey();
  var apiKey = '47bd72aae75bbb99a3a5baaff9a9a585';
  var url = 'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}';
  var response = await http.get(url);
  return json.decode(response.body);
}
