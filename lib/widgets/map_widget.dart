import 'package:concordia_navigation/providers/buildings_data.dart';
import 'package:concordia_navigation/providers/map_data.dart';
import 'package:concordia_navigation/models/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
//*****UNCOMMENT BELLOW FOR DARK MAP*****
//import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 50;
const double CAMERA_BEARING = 30;
const LatLng SGW = LatLng(45.495944, -73.578075);
const LatLng LOYOLA = LatLng(45.4582, -73.6405);
bool _campus = true;

//*****UNCOMMENT BELLOW FOR DARK MAP*****
//String _mapStyle;

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _completer;
  BuildingsData _buildings;
  LatLng _currentLocation;
  CameraPosition _initialCameraLocation;
  StreamSubscription _locationSubscription;

  Location _location = new Location();
  String error;

  @override
  void initState() {
    super.initState();
    SizeConfig();
    //*****UNCOMMENT BELLOW FOR DARK MAP*****
    //*****MIGHT IMPLEMENT AUTOMATIC DARK MODE*****
//    rootBundle.loadString('assets/map_style.txt').then((string) {
//      _mapStyle = string;
//    });
    initPlatformState();
    _locationSubscription =
        _location.onLocationChanged().listen((newLocalData) {
      setState(() {
        _currentLocation =
            LatLng(newLocalData.latitude, newLocalData.longitude);
        _initialCameraLocation = CameraPosition(
          target: _currentLocation,
          zoom: CAMERA_ZOOM,
          tilt: CAMERA_TILT,
          bearing: CAMERA_BEARING,
        );
      });
    });
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final _completer = Provider.of<MapData>(context).getCompleter;
    final _buildings = Provider.of<BuildingsData>(context);

    while (_initialCameraLocation == null) {
      return Center(child: Text("Loading Map"));
    }

    return Stack(
      children: <Widget>[
        GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            compassEnabled: false,
            tiltGesturesEnabled: true,
            buildingsEnabled: false,
            mapType: MapType.normal,
            polygons: _buildings.polygons,
            indoorViewEnabled: false,
            trafficEnabled: false,
            initialCameraPosition: _initialCameraLocation,
            onMapCreated: (controller) async {
              _completer.complete(controller);
//          controller.setMapStyle(_mapStyle);
            }),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 66,
              left: SizeConfig.safeBlockHorizontal * 83,
            ),
            child: FloatingActionButton(
              onPressed: () {
                _campus
                    ? () {
                        Provider.of<MapData>(context, listen: false)
                            .animateTo(SGW.latitude, SGW.longitude);
                        _campus = false;
                      }()
                    : () {
                        Provider.of<MapData>(context, listen: false)
                            .animateTo(LOYOLA.latitude, LOYOLA.longitude);
                        _campus = true;
                      }();
              },
              child: Icon(Icons.swap_calls),
              backgroundColor: Color(0xFFFFFFF8),
              foregroundColor: Color(0xFF656363),
              elevation: 5.0,
              heroTag: null,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 75,
              left: SizeConfig.safeBlockHorizontal * 83,
            ),
            child: FloatingActionButton(
              onPressed: () {
                Provider.of<MapData>(context, listen: false).animateTo(
                    _currentLocation.latitude, _currentLocation.longitude);
              },
              child: Icon(Icons.gps_fixed),
              backgroundColor: Color(0xFFFFFFF8),
              foregroundColor: Color(0xFF656363),
              elevation: 5.0,
              heroTag: null,
            ),
          ),
        ),
      ],
    );
  }

  initPlatformState() async {
    LocationData myLocation;
    try {
      myLocation = await _location.getLocation();
      error = "";
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
        myLocation = null;
      }
    }
    setState(() {
      _currentLocation = LatLng(myLocation.latitude, myLocation.longitude);
      _initialCameraLocation = CameraPosition(
        target: _currentLocation,
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
      );
    });
  }
}
