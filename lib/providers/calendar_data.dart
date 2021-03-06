import '../models/calendar/schedule.dart';
import '../storage/app_constants.dart' as constants;
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/widgets.dart';

/// Class representing calendar data which is part of the provider model
/// Handles data related to the calendar such as
/// transferring to related models, keeping a list of current courses
class CalendarData extends ChangeNotifier {
  DeviceCalendarPlugin _deviceCalendarPlugin = DeviceCalendarPlugin();
  List<Calendar> _calendars = List();
  List<Event> _classes = List();
  Schedule _schedule;

  Schedule get schedule => _schedule;

  @visibleForTesting
  CalendarData.test(DeviceCalendarPlugin plugin, DateTime today) {
    _deviceCalendarPlugin = plugin;
    retrieveFromDevice(today);
  }

  /// Constructor which retrieves the data for the calendar from own device's settings
  CalendarData() {
    retrieveFromDevice();
  }

  /// Checks for (and requests) permissions required by the [device calendar plugins](https://pub.dev/packages/device_calendar)
  Future<bool> _checkPermission() async {
    var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
    if (permissionsGranted.isSuccess && !permissionsGranted.data) {
      permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
      if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
        throw new Exception('Missing Calendar Permissions');
      }
    }
    return true;
  }

  /// Retrieves calendar objects from the device that match a certain format.
  Future<void> _retrieveDeviceCalendars() async {
    //Retrieve user's calendars from mobile device
    //Request permissions first if they haven't been granted
    try {
      await _checkPermission();

      // Filter to find only school related calendars
      final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
      // only accept calendar whose names are linked to concordia
      _calendars = calendarsResult?.data
          ?.where((calendar) => (calendar.isReadOnly == false))
          ?.toList();
    } catch (e) {
      print(e);
    }
  }

  /// Retrieve relevant events from device calendars.
  Future<Schedule> retrieveFromDevice([DateTime time]) async {
    if (_calendars.isEmpty) {
      await _retrieveDeviceCalendars();
    }

    DateTime now = time ?? DateTime.now();
    DateTime _firstDayOfTheWeek = now.subtract(Duration(days: now.weekday));

    // Events are loaded starting from the beginning of this week
    // This conflicts with [Schedule.byWeekday()] but device_calendar doesn't support
    // null start and end dates.
    RetrieveEventsParams retrieveEventsParams = new RetrieveEventsParams(
        startDate: _firstDayOfTheWeek,
        endDate: now.add(constants.dateLookahead));

    List<Event> events = List();

    // iterate through all calendars obtained from the device
    for (Calendar cal in _calendars) {
      // get events from this week up to 31 days from now
      final result = await _deviceCalendarPlugin.retrieveEvents(
          cal.id, retrieveEventsParams);
      // add events from that calendar to the events container
      events.addAll(result?.data);
    }

    _classes = events
        .where((event) => (
            // check title has discipline (4 letters uppercase) followed by a course # (3 digits)
            // event can't be all day
            !event.allDay &&
                event.title.toUpperCase().contains(constants.eventFilter)))
        ?.toList();

    _schedule = Schedule.fromEvents(_classes);
    notifyListeners();

    return _schedule;
  }

  /// DEPRECATED
  /// Requests the JSON from Google's calendar API then builds the Schedule object.
  /// This is a different approach to what is done with directions in that the model is built here.
  ///
  /// Constructs the URL from: premade API key + calendar url
  // Future<void> retrieveFromGoogle(
  //     {String apiKey: 'AIzaSyBHXKzGZEeBhP_m3QQ6vpI0hRODxeeEWl0',
  //     String calId = 'r9cpm71rcvjq91n86ku85ghr18'}) async {
  //   String raw = await Network.getData(
  //       'https://www.googleapis.com/calendar/v3/calendars/$calId@group.calendar.google.com/events?key=$apiKey');

  //   _schedule = Schedule.fromJson(json.decode(raw));
  //   notifyListeners();
  // }
}
