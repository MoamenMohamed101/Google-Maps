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
  BitmapDescriptor? bitmapDescriptor;

  get() async {
    bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/images/pin.png');
  }

  @override
  void initState() {
    // TODO: implement initState
    get();
  }

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
            // num1
            initialCameraPosition: const CameraPosition(
                target: LatLng(30.044465775068417, 31.2357085440791), zoom: 15),
            //num2
            onMapCreated: (GoogleMapController googleMapController) {
              setState(() {
                myMarkers.add(
                  Marker(
                    markerId: const MarkerId('0'),
                    position:
                        const LatLng(30.044465775068417, 31.2357085440791),
                    infoWindow: const InfoWindow(
                        title: 'ميدان الكوسميات',
                        snippet: 'المؤسس بهجت صابر لدعم كل مظلوم'),
                    onTap: () {
                      print('bahgt saber');
                    },
                    // num3
                    //icon: bitmapDescriptor!,
                  ),
                );
              });
            },
            markers: myMarkers,
          ),
          // const SizedBox(
          //   height: 150,
          //   child: Image(
          //     image: AssetImage('assets/images/hacker.png'),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.bottomCenter,
          //   child: const Text(
          //     'Lets play on Google Maps',
          //     style: TextStyle(fontSize: 30, color: Colors.black),
          //   ),
          // )
        ],
      ),
    );
  }
}
