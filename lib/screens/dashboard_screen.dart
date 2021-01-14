import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:together_we_fight/models/restApi.dart';
import 'package:together_we_fight/widgets/lastReport.dart';

import 'dashboard_cards.dart';

import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Report _futureReport = Provider.of<Report>(context) ?? Report();
    print(_futureReport);
    return Container(
        color: Colors.black87,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                'Overview',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'OpenSans',
                    color: Colors.white54,
                    fontWeight: FontWeight.w700),
              ),
            ),
            DashboardCards(),
            
            LastReport(),

            Container(
              padding: EdgeInsets.symmetric(horizontal:10 , vertical: 15),
              child: 
                  Column(
                    children: <Widget>[
                      Text(
                        'Above report is a live update from Health Promotion Bureau on',
                         overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                        maxLines: 4,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        _futureReport.updateDateTime != null ? _futureReport.updateDateTime : '~',
                         overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                        maxLines: 4,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
               
            ),
          ],
        ));
  }
}
