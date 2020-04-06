import 'package:concordia_navigation/models/calendar/course.dart';
import 'package:concordia_navigation/providers/outdoor_data.dart';
import 'package:concordia_navigation/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:concordia_navigation/storage/app_constants.dart' as constants;
import 'package:provider/provider.dart';

class Weekday extends StatelessWidget {
  final String weekday;
  final List<Course> courseList;

  Weekday(this.weekday, this.courseList);

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat("Hm");

    List<Widget> courseContainer = [];
    courseContainer.add(Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15.0, bottom: 15.0),
        child: Text(weekday,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
      ),
    ));

    courseList.forEach((course) => courseContainer.add(ListTile(
        contentPadding: EdgeInsets.only(
            left: SizeConfig.safeBlockHorizontal * 5.0,
            right: SizeConfig.safeBlockHorizontal * 5.0),
        leading: CircleAvatar(backgroundImage: AssetImage('assets/logo.png')),
        title: Text(
          course.summary,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${formatter.format(course?.start?.toLocal())} - ${formatter.format(course?.end?.toLocal())}",
              style: TextStyle(color: constants.blueColor),
            ),
            Text(course.filteredLocation),
          ],
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          RaisedButton(
              onPressed: (course.filteredLocation != 'N/A')
                  ? () {
                      String letter = course.filteredLocation[0];
                      if (letter == "H") {
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeCampus('sgw');
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeEnd(constants.hBuilding);
                        Provider.of<OutdoorData>(context, listen: false)
                                .controllerDestination =
                            course.location[1] == "A"
                                ? "Hall Building, Montreal"
                                : course.location;
                      } else if (letter == "M") {
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeCampus('sgw');
                        Provider.of<OutdoorData>(context, listen: false)
                            .controllerDestination = course.location;
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeEnd(constants.jmsbBuilding);
                      } else if (letter == "L") {
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeCampus('loyola');
                        Provider.of<OutdoorData>(context, listen: false)
                            .controllerDestination = "Loyola Campus, Montreal";
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeEnd(constants.loyola);
                      } else if (letter == "J") {
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeCampus('sgw');
                        Provider.of<OutdoorData>(context, listen: false)
                                .controllerDestination =
                            "John Molson Business, Montreal";
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeEnd(constants.jmsbBuilding);
                      } else if (letter == "F") {
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeCampus('sgw');
                        Provider.of<OutdoorData>(context, listen: false)
                            .controllerDestination = "FG Building, Montreal";
                        Provider.of<OutdoorData>(context, listen: false)
                            .changeEnd(constants.fgBuilding);
                      }
                      Provider.of<OutdoorData>(context, listen: false)
                          .controllerStarting = "Current Location";
                      Provider.of<OutdoorData>(context, listen: false)
                          .setItinerary();
                      Navigator.of(context).pop();
                    }
                  : null,
              elevation: 1.0,
              color: constants.appColor,
              textColor: constants.whiteColor,
              child: Text("Directions")),
          Icon(Icons.keyboard_arrow_right)
        ]))));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: courseContainer,
    );
  }
}
