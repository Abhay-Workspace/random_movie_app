import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'movie_detail.dart';
// import 'config.dart';

class MovieList extends StatefulWidget {
  var url;
  MovieList({this.url});
  @override
  MovieListState createState() {
    return new MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  var movies;
  var p;
  var connectionDone = false;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  Future<void> getData() async {
    var data;
    try {
      data = await getJson(widget.url);
    } catch (error) {
      print('error caught $error');
      return;
    }

    //movies = data['results'];
    setState(() {
      movies = data;
      connectionDone = true;
      // movies.shuffle();
    });
  }

  PageController controller = PageController();
  var currentPageValue = 0.0;

  Widget content() {
    if (connectionDone == false) {
      return CircularProgressIndicator();
    }
    if (movies == null ||
        movies['results'] == null ||
        movies['results'].length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No results found!',
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Divider(),
            Text(
              'Try different combination of filters!',
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
    return new Container(
      color: Color(0xFF1f2836),
      height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: new Padding(
        padding: const EdgeInsets.all(2.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new PageView.builder(
                // pageSnapping: false,
                controller: controller,
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount:
                    movies['results'] == null ? 0 : movies['results'].length,
                itemBuilder: (context, i) {
                  if (i == currentPageValue.floor()) {
                    try {
                      return Transform(
                        transform: Matrix4.identity()
                          ..rotateX(currentPageValue - i),
                        child: MovieDetail(movies['results'][i]),
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
                  } else if (i == currentPageValue.floor() + 1) {
                    try {
                      return Transform(
                        transform: Matrix4.identity()
                          ..rotateX(currentPageValue - i),
                        child: MovieDetail(movies['results'][i]),
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
                  } else {
                    try {
                      return MovieDetail(movies['results'][i]);
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
                  // return MovieDetail(movies['results'][i]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return content();
  }
}

Future<Map> getJson(url) async {
  // var apiKey = getApiKey();
  // 'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&page=${p}';
  var response = await http.get(url);
  return json.decode(response.body);
}
