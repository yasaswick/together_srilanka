import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:together_we_fight/models/restApi.dart';


class DashboardCards extends StatefulWidget {
  @override
  _DashboardCardsState createState() => _DashboardCardsState();
}

class _DashboardCardsState extends State<DashboardCards> {
  @override
  Widget build(BuildContext context) {
  Report _futureReport =  Provider.of<Report>(context) ?? Report();
    return Container(
      height: 200,
      margin: EdgeInsets.only(),
      child: Row(
        children: <Widget>[
          dashCard(
              type: 'Confirmed',
              titlecolor: Colors.white60,
              subcolor: Colors.white,
              status: Icon(CupertinoIcons.up_arrow , color: Colors.white,),
              value: _futureReport.localTotalCases,
              icon: 'images/bacteria.svg'),
          dashCard(
              type: 'Discharged',
              titlecolor: Colors.white60,
              subcolor: Colors.white,
              status: Icon(CupertinoIcons.ellipsis , color: Colors.white,),
              value: _futureReport.localRecovered,
              icon: 'images/biceps.svg'),
          dashCard(
              type: 'Deaths',
              titlecolor: Colors.white60,
              subcolor: Colors.white,
              status: Icon(CupertinoIcons.ellipsis , color: Colors.white,),
              value: _futureReport.localDeaths,
              icon: 'images/tombstone.svg'),
        ],
      ),
    );
  }
}



Widget dashCard(
    {String type,
    int value,
    String icon,
    Color titlecolor,
    Color subcolor,
    Icon status}
    ) {
  return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 20, top: 10, left: 5, right: 5),
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(
                  icon ,
                  height: 20,
                  width: 20,
                  allowDrawingOutsideViewBox: true,
                ),
                status

              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      value != null ? value.toString() : '~' ,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: subcolor,
                        fontSize: 22,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w500),
                  ),

                  Text(
                    type,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: titlecolor,
                        fontSize: 14,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
  );
}
