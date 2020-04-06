import 'package:concordia_navigation/models/indoor/indoor_location.dart';
import 'package:concordia_navigation/models/node.dart';
import 'package:concordia_navigation/providers/buildings_data.dart';
import 'package:concordia_navigation/providers/indoor_data.dart';
import 'package:flutter/material.dart';

class PainterService extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3.0;

    List<Node> result = IndoorData.shortest.pathTo("entrance", "110");
    List<String> names = [];
    result.forEach((element) {
      names.add(element.name);
      print(element.name);
    });

    Set<IndoorLocation> all = BuildingsData.allIndoorLocations;

    Path path = Path();
    for (IndoorLocation loc in all) {
      if (loc != null && loc.name != null) {
        if (names.contains(loc.name)) {
          if (loc == all.first) {
            path.moveTo((940 * loc.room.x) / 1000, (862 * loc.room.y / 920));
          }
          path.lineTo(
              (940 * loc.nearest.x) / 1000, (862 * loc.nearest.y / 920));
          if (loc == all.last) {
            path.lineTo((940 * loc.room.x) / 1000, (862 * loc.room.y / 920));
          }
        }
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
