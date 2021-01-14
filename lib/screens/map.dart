import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:together_we_fight/widgets/map.dart';


class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GMap());}
}