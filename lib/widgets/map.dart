import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:together_we_fight/models/restApi.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class GMap extends StatefulWidget {
  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();


  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
         ImageConfiguration(size: Size(5, 5)),
         'images/cross.png').then((onValue) {
            pinLocationIcon = onValue;
         });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    LatLng pinPosition = LatLng(6.9225, 79.9182);

    return Stack(
      children: <Widget>[
        Container(
            child: GoogleMap(
              markers: _markers,
          initialCameraPosition:
              CameraPosition(target: LatLng(6.927079, 79.861244), zoom: 10),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);

          setState(() {

            _markers.add(
            Marker(
               markerId: MarkerId('test'),
               infoWindow: InfoWindow(title: "IDH Hospital"),
               position: pinPosition,
               icon: pinLocationIcon
            ));
            
          });


          }
        )
        ),
        HospitalList()
      ],
    );
  
  
  
  
  
  
  }




}



Marker marker2 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

    Marker marker3 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

    Marker marker4 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

    Marker marker5 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

Marker marker6 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker marker7 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker marker8 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker marker9 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker marker10 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker marker11 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker marker12 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
Marker marker13 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker marker14 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker marker15 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker marker16 = Marker(
    markerId: MarkerId('IDH'),
    position: LatLng(6.9225, 79.9182),
    infoWindow: InfoWindow(title: "IDH Hospital"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
  




class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  @override
  Widget build(BuildContext context) {
    Report _futureReport = Provider.of<Report>(context) ?? Report();
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: MediaQuery.of(context).padding,
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _futureReport.hospitalData.length,
          itemBuilder: (context, index) {
            return HospitalCard(_futureReport.hospitalData[index]);
          }),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final HospitalData _data;
  HospitalCard(this._data);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: CupertinoColors.label,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 5, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _data.hospital.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: CupertinoColors.white),
            ),
            Text("Admitted : " + _data.treatmentTotal.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: CupertinoColors.white))
          ],
        ),
      ),
    );
  }
}
