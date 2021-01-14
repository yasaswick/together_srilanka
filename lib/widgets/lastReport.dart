import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:together_we_fight/models/restApi.dart';

class LastReport extends StatefulWidget {
  @override
  _LastReportState createState() => _LastReportState();
}

class _LastReportState extends State<LastReport> {
  @override
  Widget build(BuildContext context) {
    Report _futureReport = Provider.of<Report>(context);

    if (_futureReport != null) {
      return Container(
              child: Stack(
          children: <Widget>[
            
            Container(
              margin: EdgeInsets.only(top:30 ),
                          child: Container(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal:20),
                  padding: EdgeInsets.only(left: 10, top: 30, right: 10 , bottom: 10 ),
                  child: Column(
                    children: <Widget>[
                      ReportTile(
              "Local new cases", _futureReport.localNewCases.toString()),
                      ReportTile("Total total cases",
              _futureReport.localTotalCases.toString()),
                      ReportTile(
              "Local deaths", _futureReport.localDeaths.toString()),
                      ReportTile(
              "Local recovered", _futureReport.localRecovered.toString()),
                      ReportTile("Global new cases",
              _futureReport.globalNewCases.toString()),
                      ReportTile("Global total cases",
              _futureReport.globalTotalCases.toString()),
                      ReportTile(
              "Global deaths", _futureReport.globalDeaths.toString()),
                      ReportTile("Global recovered",
              _futureReport.globalRecovered.toString()),
                    
                    ],
                  ),
                ),
            ),

            Positioned(
              left: 10,
                        child: Card(
                          elevation: 10,
                                                  child: Container(
                padding: EdgeInsets.all(15),
                color: CupertinoColors.activeOrange,
                child: Text("Last Report",style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.black,
                  fontWeight: FontWeight.w700),),
              ),
                        ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}

class ReportTile extends StatelessWidget {
  final String title;
  final String value;

  ReportTile(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(title , style: TextStyle(fontSize: 16 , color: Colors.white60),), Text(value  , style: TextStyle(fontSize: 16, color: Colors.white70))],
      ),
    );
  }
}
