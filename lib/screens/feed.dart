import 'package:flutter/material.dart';
import 'package:together_we_fight/screens/news_cards.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        color: Colors.black87,
        child: NewsCards(),
      ),
    );
  }
}