/// All application constants are stored here.

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng sgw = LatLng(45.495944, -73.578075);
const LatLng loyola = LatLng(45.4582, -73.6405);
const LatLng hBuilding = LatLng(45.497094, -73.578797);
const LatLng jmsbBuilding = LatLng(45.495549, -73.579036);
const LatLng fgBuilding = LatLng(45.494344, -73.578442);

final RegExp removeHTML = RegExp(
    r'(<\/?\w+\/?>?| \w+=\"\w+-\w+:\d.\d\w+\">)'); //Regex to replace certain special characters in HTML with whitespace

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 50;
const double CAMERA_BEARING = 30;

const double containerWidth = 940.0;
const double containerHeight = 862.0;
const double svgWidth = 1000;
const double svgHeight = 920.0;

const Color appColor = Color(0xFF000000);
const Color whiteColor = Color(0xFFFFFFFF);
const Color blueColor = Color(0xFF017BFF);
const Color blackColor = Color(0xFF000000);
const Color lightGreyColor = Color(0xFFF0F0F0);
const Color greyColor = Color(0xFF656363);
const Color highlightColor = Color(0xFF014FFF);

const String apiKey = 'AIzaSyBHXKzGZEeBhP_m3QQ6vpI0hRODxeeEWl0';

final RegExp calFilter = RegExp("conco|school|uni|test");
final RegExp eventFilter = RegExp(r"[A-Z]{4}[-|\s]?\d{3}");
final RegExp classroomFilter = RegExp(
    r"(H\ ?\d{3}|MB\ ?S?[1-9]\.[0-9]{3}|FG\ ?B-?0[3-8]0)",
    caseSensitive: false);

final Duration dateLookahead = Duration(days: 31);
