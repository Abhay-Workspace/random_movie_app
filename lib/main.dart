import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

import 'package:filter_list/filter_list.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'menu_page.dart';
import 'movie_list.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Dare',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF1f2836)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Movie Dare'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  bool isSelected = false;

  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MotionTabController _tabController;
  var page;
  var flag = false;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Future<void> getData(url) async {
    var data;
    try {
      data = await getJson(url);
      if (data['total_pages'] > 0) {
        Random random = new Random();
        page = random.nextInt(data['total_pages']) + 1;
      } else
        page = 0;
    } catch (error) {
      page = 0;
      print('error caught $error');
      return;
    }
  }

  List<String> countList = [
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "History",
    "Horror",
    "Music",
    "Mystery",
    "Romance",
    "Science Fiction",
    "TV Movie",
    "Thriller",
    "War",
    "Western",
  ];

  var keyMap = {
    "Action": "28",
    "Adventure": "12",
    "Animation": "16",
    "Comedy": "35",
    "Crime": "80",
    "Documentary": "99",
    "Drama": "18",
    "Family": "10751",
    "Fantasy": "14",
    "History": "36",
    "Horror": "27",
    "Music": "10402",
    "Mystery": "9648",
    "Romance": "10749",
    "Science Fiction": "878",
    "TV Movie": "10770",
    "Thriller": "53",
    "War": "10752",
    "Western": "37",
  };

  List<String> selectedCountList = [];
  var count = 0;
  var connectionDone = false;

  void _openFilterDialog() async {
    await FilterListDialog.display(
      context,
      allTextList: countList,
      height: 480,
      unselectedTextbackGroundColor: Colors.black12,
      //backgroundColor: Colors.white12,
      selectedTextBackgroundColor: Color(0xFF1f2836),
      borderRadius: 20,
      headlineText: "Select",
      searchFieldHintText: "Search Here",
      selectedTextList: selectedCountList,
      onApplyButtonClick: (list) {
        if (list != null) {
          setState(() {
            selectedCountList = List.from(list);
            connectionDone = true;
          });
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        leading: new IconButton(
          icon: new Icon(Icons.emoji_food_beverage),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: body(_tabController.index),
      ),
      bottomNavigationBar: MotionTabBar(
        labels: ["Hot", "Popular", "Genre"],
        initialSelectedTab: "Hot",
        tabIconColor: Color(0xFF1f2836),
        tabSelectedColor: Color(0xFF1f2836),
        onTabItemSelected: (int value) {
          setState(
            () {
              _tabController.index = value;
              connectionDone = false;
              if (value == 2) _openFilterDialog();
            },
          );
        },
        icons: [Icons.trending_up, Icons.movie, Icons.category],
        textStyle: TextStyle(
          color: Color(0xFF1f2836),
          fontWeight: FontWeight.bold,
          // fontSize: 18.0,
        ),
      ),
    );
  }

  Widget body(value) {
    // Random random = new Random();
    // page = random.nextInt(100) + 1;
    var apiKey = '<Your TMDB API KEY>';
    if (value == 0) {
      var url =
          'https://api.themoviedb.org/3/trending/all/day?api_key=${apiKey}';
      getData(url);
      url = url + '&page=$page';
      return MovieList(url: url);
    } else if (value == 1) {
      var url = 'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}';
      getData(url);
      url = url + '&page=$page';
      return MovieList(url: url);
    } else {
      var genres = '';
      for (var i = 0; i < selectedCountList.length; i++) {
        genres += keyMap[selectedCountList[i]] + ",";
      }
      // print(genres);
      // page = random.nextInt(10) + 1;
      var url =
          'https://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&with_genres=${genres}';
      // print(url);
      // connectionDone = false;
      if (connectionDone == false) {
        return CircularProgressIndicator();
      } else if (genres == '') {
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
                'It seems you have not selected any genre.',
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      } else {
        getData(url);
        url = url + '&page=$page';
        return MovieList(url: url);
      }
    }
  }
}
