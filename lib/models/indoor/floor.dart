import 'package:concordia_navigation/models/indoor/classroom.dart';
import 'package:concordia_navigation/models/indoor/indoor_poi.dart';

class Floor {
  int floorNumber;

  // TODO: one set of IndoorLocation and use polymorphism
  Set<Classroom> classrooms = {};
  Set<IndoorPOI> indoorPois = {};

  Floor.fromJson(Map json) {
    this.floorNumber = int.parse(json['number']);

    for (int i = 0; i < json['classrooms'].length; i++) {
      Classroom temp = Classroom.fromJson(json['classrooms'][i]);
      if (temp != null) classrooms.add(temp);
    }

    for (int i = 0; i < json['poi'].length; i++) {
      IndoorPOI temp = IndoorPOI.fromJson(json['poi'][i]);
      if (temp != null) indoorPois.add(temp);
    }
  }
}
