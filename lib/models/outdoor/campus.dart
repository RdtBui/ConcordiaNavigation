import 'dart:convert';
import 'package:concordia_navigation/models/outdoor/building.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Campus {
  String name;
  String initials;
  LatLng latlng;
  Set<Building> buildings = {};
  static Campus sgw;
  static Campus loy;

  Campus.fromJson(Map json) {
    this.name = json['campusName'];
    this.initials = json['campusInitials'];

    for (int bIndex = 0; bIndex < json['buildings'].length; bIndex++) {
      Building temp = Building.fromJson(json['buildings'][bIndex]);
      if (temp != null && temp.buildingInitials != null) buildings.add(temp);
    }
  }

  ///For reading the file
  static Future<List<dynamic>> loadJson() async =>
      json.decode(await rootBundle.loadString('assets/campus_buildings.json'));
}
