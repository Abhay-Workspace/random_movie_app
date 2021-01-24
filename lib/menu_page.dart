import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'credits.dart';
import 'privacy_and_policy.dart';
import 'terms_and_conditions.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  _launchURL() async {
    const url = 'https://www.buymeacoffee.com/abhaypaswan';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Dare'),
        backgroundColor: Color(0xFF1f2836),
      ),
      body: Container(
        color: Colors.grey[50],
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 400.0,
                width: 400.0,
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  // shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1f2836),
                      offset: const Offset(5.0, 5.0),
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.emoji_food_beverage,
                      size: 100,
                      color: Colors.brown[900],
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Hi! I\'m your app \"Movie Dare\".',
                            style: TextStyle(
                              fontSize: 16,
                              // color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'So you might have noticed that there are lot of bugs in me.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            ' Ya ya, I know I suck. Actually no, my developer sucks!!',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'But could you do me a favour, buy him a coffee so that he can fix me.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _launchURL,
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Buy him a Coffee!',
                                  style: TextStyle(
                                    color: Colors.brown[100],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.emoji_food_beverage_rounded,
                                  color: Colors.brown,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsAndConditions()),
                          );
                        },
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyAndPolicy()),
                          );
                        },
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Credits()),
                          );
                        },
                        child: Text(
                          'Credits',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
