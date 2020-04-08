import 'package:concordia_navigation/providers/map_data.dart';
import 'package:concordia_navigation/services/painters.dart';
import 'package:concordia_navigation/widgets/indoor/indoor_widget.dart';
import 'package:flutter/material.dart';
import 'package:concordia_navigation/storage/app_constants.dart' as constants;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Arguments {
  final bool showDirections;

  Arguments(this.showDirections);
}

class IndoorPage extends StatelessWidget {
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context).settings.arguments;
    String startDestination = Provider.of<MapData>(context).startIndoor;
    String endDestination = Provider.of<MapData>(context).endIndoor;
    return Scaffold(
      backgroundColor: constants.whiteColor,
      appBar: AppBar(
        title: Text("Indoor View"),
        backgroundColor: constants.appColor,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: Painters.painters.length,
              itemBuilder: (context, index) {
                return IndoorWidget(index, args.showDirections,
                    startDestination, endDestination);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 75.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: "btn1",
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  backgroundColor: constants.blackColor,
                  child: Center(
                    child: Text(
                      "H1",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.normal,
                          color: constants.whiteColor,
                          fontSize: 20.0),
                    ),
                  ),
                  onPressed: () {
                    controller.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  backgroundColor: constants.blackColor,
                  child: Center(
                    child: Text(
                      "H8",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.normal,
                          color: constants.whiteColor,
                          fontSize: 20.0),
                    ),
                  ),
                  onPressed: () {
                    controller.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
                FloatingActionButton(
                  heroTag: "btn3",
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  backgroundColor: constants.blackColor,
                  child: Center(
                    child: Text(
                      "H9",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.normal,
                          color: constants.whiteColor,
                          fontSize: 20.0),
                    ),
                  ),
                  onPressed: () {
                    controller.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
                FloatingActionButton(
                  heroTag: "btn4",
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  backgroundColor: constants.blackColor,
                  child: Center(
                    child: Text(
                      "MB1",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.normal,
                          color: constants.whiteColor,
                          fontSize: 20.0),
                    ),
                  ),
                  onPressed: () {
                    controller.animateToPage(3,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
