import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
          body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: MediaQuery.of(context).padding,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                      onTap: ()=>  null,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(CupertinoIcons.info)))
                ],
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: GestureDetector(
                      onTap: ()=> print('object'),
                      child: Text('To be implemented')),
                  ),
                ),
              )
            ],
          )),
    );
  }
}


