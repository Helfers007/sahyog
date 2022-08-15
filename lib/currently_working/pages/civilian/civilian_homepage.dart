import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sahyog/currently_working/global_variables.dart';

class CivilHomePage extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "SahYog",
              style: TextStyle(
                  shadows: [Shadow(color: Colors.white, blurRadius: 20)]),
            ),
            Text(
              "Civilian",
              style: TextStyle(
                  fontSize: 12,
                  shadows: [Shadow(color: Colors.white, blurRadius: 20)]),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          // Align(
          //     alignment: Alignment.bottomCenter,
          //     child: TextButton.icon(
          //       style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all(
          //               Color.fromARGB(255, 216, 143, 32))),
          //       onPressed: () {},
          //       icon: Container(
          //         color: Colors.green,
          //         child: Icon(
          //           Icons.arrow_drop_down,
          //           color: Colors.white,
          //         ),
          //       ),
          //       label: Text(
          //         "Call for Help",
          //         style: TextStyle(
          //             color: Colors.redAccent, fontWeight: FontWeight.bold),
          //       ),
          //     )),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFFFD595))),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Call For Help',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.red,
                            )
                          ]),
                    ), // <-- Text
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      // <-- Icon
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFFFD595),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(9),
              width: double.infinity,
              color: Colors.white,
              child: ListTile(
                leading: Image.asset("assets/logo.png"),
                title: Text("USERNAME"),
                subtitle: Text("5658969866"),
              ),
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text(
                "Alerts and Notifications",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            Column(
              children: [
                Text('Noti 1'),
                Text('Noti 2'),
                Text('Noti 3'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
