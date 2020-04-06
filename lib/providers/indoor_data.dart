import 'package:concordia_navigation/models/node.dart';
import 'package:concordia_navigation/services/dijkstra.dart';
import 'package:flutter/material.dart';

class IndoorData extends ChangeNotifier {
  static Dijkstra shortest;
  static Set<Node> allIndoorLocations = {};
}