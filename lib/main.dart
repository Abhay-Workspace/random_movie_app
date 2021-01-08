import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/TabItem.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

// import 'package:flutter/src/material/colors.dart';

import './Menu.dart';
import 'movie_page.dart';
import 'movie_list.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Dare',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: createMaterialColor(Color(0xFF1f2836)),
        // primarySwatch: createMaterialColor(Colors.redAccent),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Movie Dare'),
    );
  }
}

class MyHomePage extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // child: MovieList(p: page),
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
    Random random = new Random();
    var page = random.nextInt(100) + 1;
    var apiKey = '47bd72aae75bbb99a3a5baaff9a9a585';
    if (value == 0) {
      var url =
          'https://api.themoviedb.org/3/trending/all/day?api_key=${apiKey}';
      return MovieList(url: url);
    } else if (value == 1) {
      var url =
          'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&page=${page}';
      return MovieList(url: url);
    } else {
      var url =
          'https://api.themoviedb.org/3/trending/all/day?api_key=${apiKey}';
      return MovieList(url: url);
    }
  }
}
