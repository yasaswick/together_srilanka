import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:together_we_fight/helpers/api.dart';
import 'package:together_we_fight/helpers/firestore.dart';
import 'package:together_we_fight/models/news.dart';
import 'package:together_we_fight/screens/dashboard_screen.dart';
import 'package:together_we_fight/screens/feed.dart';
import 'package:together_we_fight/screens/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:together_we_fight/screens/map.dart';

import 'models/restApi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Together, We Fight',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FirestoreDb _db = FirestoreDb();
  final Api _api = Api();

  int currentTabIndex = 1;

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  List<Widget> tabs = [
    Dashboard(),
    Feed(),
    MapPage(),
    Info(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<News>>.value(value: _db.newsList),
        FutureProvider<Report>.value(value: _api.fetchReport()),
      ],
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: CupertinoColors.darkBackgroundGray,
            activeColor: CupertinoColors.activeOrange,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), title: Text("Dashboard")),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.news), title: Text("News")),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.location), title: Text("Map")),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.book), title: Text("Prevention"))
            ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return Dashboard();
              break;
            case 1:
              return Feed();
              break;
            case 2:
              return MapPage();
              break;
            case 3:
              return Info();
              break;
            default:
              return Dashboard();
              break;
          }
        },
      ),
    );
  }
}
