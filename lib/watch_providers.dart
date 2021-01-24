import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WatchProviders extends StatefulWidget {
  var url;
  WatchProviders({this.url});

  @override
  _WatchProvidersState createState() => _WatchProvidersState();
}

class _WatchProvidersState extends State<WatchProviders> {
  var providers;
  var connectionDone = false;

  Future<void> getData() async {
    var data;
    try {
      data = await getJson(widget.url);
      // movies['results'].shuffle();
      // print("data ${data['results'][0]['title']}");
    } catch (error) {
      print('error caught $error');
      return;
    }

    //movies = data['results'];
    setState(() {
      providers = data;
      connectionDone = true;
      // movies.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return content();
  }

  Widget content() {
    if (connectionDone == false) {
      return Text('Fetching Watch Providers...');
    }
    if (providers == null) {
      return Text('Couldn\'t find any provider...');
    }
    return Container();
  }
}

Future<Map> getJson(url) async {
  // var apiKey = getApiKey();
  // 'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&page=${p}';
  var response = await http.get(url);
  return json.decode(response.body);
}
