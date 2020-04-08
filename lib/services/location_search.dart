import 'package:concordia_navigation/storage/app_constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:concordia_navigation/providers/map_data.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

/*This class extends Search Delegate class implemented by flutter.
It will be called when the user clicks on the search button in the Appbar.
*/
class LocationSearch extends SearchDelegate {
  static List classrooms;
  final recentRooms = [
    'HALL BUILDING',
    'H837',
    'MB1.437'
  ]; // for demonstration purposes

  static Future<List> loadJson() async =>
      json.decode(await rootBundle.loadString('assets/destinations.json'));

  ///This method returns suggested locations to the user, in this case Loyola and SGW campus.
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentRooms
        : classrooms.where((p) => p.contains(query.toUpperCase())).toList();

    return Consumer<MapData>(builder: (context, mapData, child) {
      return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () async {
            mapData.controllerStarting = "Current Location";
            mapData.changeStart(mapData.getCurrentLocation);
            switch (suggestionList[index][0].toString()) {
              case "H":
                {
                  if (suggestionList[index][1].toString() == "A") {
                    mapData.animateTo(constants.hBuilding.latitude,
                        constants.hBuilding.longitude);
                    mapData.changeCampus('sgw');
                    mapData.controllerDestination = "Hall Building, Montreal";
                    mapData.changeEnd(constants.hBuilding);
                    mapData.generateIndoor = false;
                  } else {
                    mapData.animateTo(constants.hBuilding.latitude,
                        constants.hBuilding.longitude);
                    mapData.changeCampus('sgw');
                    mapData.generateIndoor = true;
                    mapData.startIndoor = "H1entrance";
                    mapData.endIndoor = suggestionList[index].toString();
                    mapData.controllerDestination =
                        suggestionList[index].toString();
                    mapData.changeEnd(constants.hBuilding);
                  }
                }
                break;

              case "M":
                {
                  mapData.animateTo(constants.jmsbBuilding.latitude,
                      constants.jmsbBuilding.longitude);
                  mapData.changeCampus('sgw');
                  mapData.controllerDestination =
                      suggestionList[index].toString();
                  mapData.generateIndoor = true;
                  mapData.startIndoor = "MBentrance";
                  mapData.endIndoor = suggestionList[index].toString();
                  mapData.changeEnd(constants.jmsbBuilding);
                }
                break;

              case "L":
                {
                  mapData.animateTo(
                      constants.loyola.latitude, constants.loyola.longitude);
                  mapData.changeCampus('loyola');
                  mapData.controllerDestination = "Loyola Campus, Montreal";
                  mapData.changeEnd(constants.loyola);
                  mapData.generateIndoor = false;
                }
                break;

              case "J":
                {
                  mapData.animateTo(constants.hBuilding.latitude,
                      constants.hBuilding.longitude);
                  mapData.changeCampus('sgw');
                  mapData.controllerDestination =
                      "John Molson Business, Montreal";
                  mapData.changeEnd(constants.jmsbBuilding);
                  mapData.generateIndoor = false;
                }
                break;
              case "F":
                {
                  mapData.animateTo(constants.fgBuilding.latitude,
                      constants.fgBuilding.longitude);
                  mapData.changeCampus('sgw');
                  mapData.controllerDestination = "FG Building, Montreal";
                  mapData.changeEnd(constants.fgBuilding);
                  mapData.generateIndoor = false;
                }
                break;

              default:
                {
                  mapData.animateTo(
                      constants.sgw.latitude, constants.sgw.longitude);
                  mapData.changeCampus('sgw');
                  mapData.controllerDestination = "SGW Campus, Montreal";
                  mapData.changeEnd(constants.sgw);
                  mapData.generateIndoor = false;
                }
                break;
            }
            mapData.changeMode("driving");
            mapData.setItinerary();
            Navigator.of(context).pop();
          },
          leading: Icon(Icons.location_city),
          title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: constants.blackColor, fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                    color: constants.greyColor,
                  ),
                ),
              ])),
        ),
        itemCount: suggestionList.length,
      );
    });
  }

  ///This method adds a return IconButton to return to the homepage.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  ///This method add the a clear IconButton to clear user's input.
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  ///This method returns results from user input.
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
}
