import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:together_we_fight/models/news.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCards extends StatefulWidget {
  @override
  _NewsCardsState createState() => _NewsCardsState();
}

class _NewsCardsState extends State<NewsCards> {
  @override
  Widget build(BuildContext context) {
    final newsList = Provider.of<List<News>>(context) ?? [];

    if (newsList.length == 0) {
      return Center(
          child: Card(
        child: Container(
          color: CupertinoColors.activeOrange,
          padding: EdgeInsets.all(10),
          child: Text('Updating' ),
        ),
      ));
    } else {
      return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return NewsCard(newsList[index]);
        },
      );
    }
  }
}

class NewsCard extends StatelessWidget {
  final News _news;
  NewsCard(this._news);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(color: Colors.black),
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: CachedNetworkImage(
                    imageUrl: this._news.newsImage,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  )),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this._news.newsTitle,
                          style: TextStyle(color: Colors.white),
                        ),
                        // Text(
                        //   this._news.newsSubTitle,
                        //   style: TextStyle(color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
                ],
              )),
          Card(
            elevation: 6,
            child: Container(
              color: Colors.white,
              child: Text(timeago.format(
                  DateTime.fromMillisecondsSinceEpoch(this._news.newsTime))),
              //  margin: EdgeInsets.only(left:5 ,top: 10),
              padding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
}
