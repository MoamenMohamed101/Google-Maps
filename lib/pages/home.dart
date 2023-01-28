import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myMarkers = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Google Maps'),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
                target: LatLng(30.044465775068417, 31.2357085440791), zoom: 15),
            //num1
            onMapCreated: (GoogleMapController googleMapController) {
              setState(() {
                myMarkers.add(
                  const Marker(
                    markerId: MarkerId('0'),
                    position: LatLng(30.044465775068417, 31.2357085440791),
                  ),
                );
              });
            },
            markers: myMarkers,
          ),
          const SizedBox(
            height: 150,
            child: Image(
              image: AssetImage('assets/images/hacker.png'),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: const Text(
              'Lets play on Google Maps',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
