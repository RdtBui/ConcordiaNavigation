import 'package:concordia_navigation/providers/map_data.dart';
import 'package:concordia_navigation/storage/app_constants.dart' as constants;
import 'package:concordia_navigation/services/size_config.dart';
import 'package:concordia_navigation/widgets/directions_list_widget.dart';
import 'package:concordia_navigation/widgets/outdoor/map_widget.dart';
import 'package:concordia_navigation/widgets/search_bars.dart';
import 'package:concordia_navigation/widgets/shuttle_widget.dart';
import 'package:concordia_navigation/widgets/transportation_mode_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      margin: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
      controller: Provider.of<MapData>(context, listen: false).panelController,
      maxHeight: SizeConfig.safeBlockVertical * 85,
      minHeight: SizeConfig.safeBlockVertical * 3.5,
      defaultPanelState: PanelState.CLOSED,
      backdropEnabled: true,
      backdropOpacity: 0.3,
      parallaxEnabled: false,
      borderRadius: BorderRadius.all(Radius.circular(14.0)),
      boxShadow: [
        BoxShadow(
          blurRadius: 20.0,
          color: constants.lightGreyColor.withOpacity(0.6),
        ),
      ],
      panel: Consumer<MapData>(
        builder: (context, mapData, child) => Container(
          decoration: BoxDecoration(
            color: constants.appColor,
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
          ),
          child: Column(
            children: <Widget>[
              TransportationModeWidget(),
              SearchBars(), // top row for transportation mode selection
              DirectionsList(), // list of directions
              ShuttleWidget(),
            ],
          ),
        ),
      ),
      body: MapWidget(),
    );
  }
}
