import 'package:flutter/material.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Dare'),
        backgroundColor: Color(0xFF1f2836),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Privacy Policy',
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
