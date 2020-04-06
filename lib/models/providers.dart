import 'package:concordia_navigation/models/user_location.dart';
import 'package:concordia_navigation/providers/calendar_data.dart';
import 'package:concordia_navigation/providers/outdoor_data.dart';
import 'package:concordia_navigation/services/outdoor/location_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:concordia_navigation/providers/buildings_data.dart';

List<SingleChildWidget> providers = [
  StreamProvider<UserLocation>(
    create: (context) => LocationService.getInstance().stream,
    initialData: UserLocation.sgw(),
  ),
  ChangeNotifierProvider<OutdoorData>(
    create: (context) => OutdoorData(),
  ),
  ChangeNotifierProvider<BuildingsData>(
    create: (context) => BuildingsData(),
  ),
  ChangeNotifierProvider<CalendarData>(
    create: (_) => CalendarData(),
  ),
];
