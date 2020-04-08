import 'package:concordia_navigation/providers/map_data.dart';
import 'package:concordia_navigation/screens/indoor_page.dart';
import 'package:flutter/material.dart';
import 'package:concordia_navigation/storage/app_constants.dart' as constants;
import 'package:concordia_navigation/services/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:concordia_navigation/widgets/shuttle_tile.dart';
import 'package:provider/provider.dart';

//Shuttle Widget at the bottom of the Directions Page.
class ShuttleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
              color: constants.appColor,
            ),
            height: SizeConfig.safeBlockVertical * 5,
            width: SizeConfig.screenWidth,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/indoor',
                          arguments: Arguments(
                              Provider.of<MapData>(context, listen: false)
                                  .generateIndoor));
                    },
                    child: Text(
                      "Go Indoor!",
                      style: GoogleFonts.raleway(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: constants.whiteColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/shuttle');
                      },
                      child: Text(
                        "View Schedule",
                        style: GoogleFonts.raleway(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: constants.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Container(
              color: constants.whiteColor,
              height: SizeConfig.safeBlockVertical * 12,
              width: SizeConfig.screenWidth,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ShuttleTile(),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 30.0, top: 12.0),
                        height: SizeConfig.safeBlockVertical * 8,
                        width: SizeConfig.safeBlockHorizontal * 20,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "20mins",
                              style: GoogleFonts.raleway(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: constants.appColor,
                              ),
                            ),
                            Text(
                              "8.6km",
                              style: GoogleFonts.raleway(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: constants.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
