import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:concordia_navigation/providers/map_data.dart';

class LocationSearch extends SearchDelegate {
  LatLng sgw = LatLng(45.495944, -73.578075);
  LatLng loyola = LatLng(45.4582, -73.6405);
  String mode = "Driving";

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: <Widget>[
        Consumer<MapData>(
          builder: (context, mapData, child) {
            return ListTile(
              leading: Icon(Icons.location_city),
              title: Text("SGW Campus, Montreal"),
              subtitle: Text("Quebec, Canada"),
              onTap: () {
                Navigator.of(context).pop();
                mapData.animateTo(45.496676, -73.578760);
              },
            );
          },
        ),
        Consumer<MapData>(
          builder: (context, mapData, child) {
            return ListTile(
              leading: Icon(Icons.location_city),
              title: Text("Loyola Campus, Montreal"),
              subtitle: Text("Quebec, Canada"),
              onTap: () {
                Navigator.of(context).pop();
                Provider.of<MapData>(context, listen: false)
                    .controllerDestination
                    .text = "Loyola Campus, Montreal";
                Provider.of<MapData>(context, listen: false)
                    .controllerStaring
                    .text = "Current Location";
                Provider.of<MapData>(context, listen: false).start = sgw;
                Provider.of<MapData>(context, listen: false).end = loyola;
                Provider.of<MapData>(context, listen: false).mode = mode;

                Navigator.pushNamed(context, '/directions');
//                mapData.animateTo(45.4582, -73.6405);
              },
            );
          },
        ),
      ],
    );
  }

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

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
}
