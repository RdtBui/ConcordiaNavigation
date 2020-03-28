import 'package:concordia_navigation/models/course.dart';
import 'package:concordia_navigation/providers/calendar_data.dart';
import 'package:concordia_navigation/storage/app_constants.dart' as constants;
import 'package:concordia_navigation/widgets/weekday.dart';
import 'package:flutter/material.dart';
import 'package:concordia_navigation/services/localization.dart';
import 'package:provider/provider.dart';

/// User Schedule Screen
/// This should have no business logic, only handling data generated by service classes and models.
class CourseSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Iterable<Course>> weekdays =
        Provider.of<CalendarData>(context).schedule?.byWeekday();
    List<Widget> weekdayContainer = [];

    while (weekdays == null) {
      return Center(child: CircularProgressIndicator());
    }

    for (int i = 0; i < weekdays.length; i++) {
      List<Course> courseList = weekdays[i];
      if (courseList.isNotEmpty) {
        String weekday;
        if (i == 0) {
          weekday = "Monday";
        } else if (i == 1) {
          weekday = "Tuesday";
        } else if (i == 2) {
          weekday = "Wednesday";
        } else if (i == 3) {
          weekday = "Thursday";
        } else {
          weekday = "Friday";
        }
        weekdayContainer.add(Weekday(weekday, courseList));
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(ConcordiaLocalizations.of(context).schedule),
          backgroundColor: constants.greenColor,
          actions: <Widget>[
            // action button
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                tooltip: "Refresh",
                icon: Icon(Icons.refresh),
                onPressed: () {
                  Provider.of<CalendarData>(context, listen: false)
                      .retrieveFromDevice();
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(child: Column(children: weekdayContainer)));
  }
}
