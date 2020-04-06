import 'package:concordia_navigation/screens/indoor_page.dart';
import 'package:concordia_navigation/services/painters.dart';
import 'package:concordia_navigation/services/size_config.dart';
import 'package:concordia_navigation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:concordia_navigation/widgets/homepage_appbar.dart';

//The app will launch here.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //LoadBuildingInfo();
    Painters();
    return Scaffold(
      appBar: HomePageAppBar(),
      drawer: CustomDrawer(),
      body: Stack(children: <Widget>[
      //  MapWidget(),
      //  DirectionsDrawer(),
        IndoorPage(),
      ]),
    );
  }
}
