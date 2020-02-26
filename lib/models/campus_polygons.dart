import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CampusPolygons extends ChangeNotifier {
  final Set<Polygon> allPolygons = new Set();

  Map<String, List<LatLng>> buildings = {
    "Hbuilding": [
      LatLng(45.49738, -73.57833),
      LatLng(45.49755, -73.57869),
      LatLng(45.49772, -73.57903),
      LatLng(45.49744, -73.57929),
      LatLng(45.497171, -73.57954),
      LatLng(45.49702, -73.57923),
      LatLng(45.496837, -73.578848),
      LatLng(45.49715, -73.57855),
    ],
    "LBbuilding": [
      LatLng(45.49704, -73.57829),
      LatLng(45.49728, -73.57806),
      LatLng(45.49716, -73.57782),
      LatLng(45.49713, -73.57785),
      LatLng(45.4971, -73.5778),
      LatLng(45.4971, -73.57781),
      LatLng(45.49709, -73.57779),
      LatLng(45.49713, -73.57775),
      LatLng(45.49706, -73.57759),
      LatLng(45.49701, -73.57763),
      LatLng(45.49701, -73.57762),
      LatLng(45.49702, -73.57761),
      LatLng(45.497, -73.57757),
      LatLng(45.49703, -73.57754),
      LatLng(45.49696, -73.5774),
      LatLng(45.49691, -73.57729),
      LatLng(45.49675, -73.57744),
      LatLng(45.49663, -73.57756),
      LatLng(45.49666, -73.5776),
      LatLng(45.4966, -73.57765),
      LatLng(45.49651, -73.57747),
      LatLng(45.49644, -73.57754),
      LatLng(45.49632, -73.57765),
      LatLng(45.49627, -73.5777),
      LatLng(45.49643, -73.57802),
      LatLng(45.49658, -73.57834),
      LatLng(45.49669, -73.57857),
      LatLng(45.49673, -73.57853),
      LatLng(45.49675, -73.57858),
      LatLng(45.49691, -73.57841),
      LatLng(45.49689, -73.57837),
      LatLng(45.49693, -73.57833),
      LatLng(45.49691, -73.57829),
      LatLng(45.49696, -73.57825),
      LatLng(45.49698, -73.57829),
      LatLng(45.497, -73.57828),
      LatLng(45.49702, -73.57826),
    ],
    "FB": [
      LatLng(45.49491, -73.57779),
      LatLng(45.49471, -73.57802),
      LatLng(45.4947, -73.57803),
      LatLng(45.49471, -73.57804),
      LatLng(45.49463, -73.57812),
      LatLng(45.49455, -73.57823),
      LatLng(45.49437, -73.57843),
      LatLng(45.49438, -73.57844),
      LatLng(45.49431, -73.57852),
      LatLng(45.4943, -73.57851),
      LatLng(45.49421, -73.57862),
      LatLng(45.49397, -73.5789),
      LatLng(45.49383, -73.57907),
      LatLng(45.49373, -73.57889),
      LatLng(45.49363, -73.57873),
      LatLng(45.49375, -73.57859),
      LatLng(45.49386, -73.57846),
      LatLng(45.49384, -73.57844),
      LatLng(45.49389, -73.57838),
      LatLng(45.4939, -73.5784),
      LatLng(45.49393, -73.57836),
      LatLng(45.49392, -73.57834),
      LatLng(45.49402, -73.57822),
      LatLng(45.49411, -73.57811),
      LatLng(45.49412, -73.57813),
      LatLng(45.49421, -73.57802),
      LatLng(45.49419, -73.57799),
      LatLng(45.49438, -73.57777),
      LatLng(45.4944, -73.5778),
      LatLng(45.49444, -73.57776),
      LatLng(45.4944, -73.57769),
      LatLng(45.49446, -73.57762),
      LatLng(45.4944, -73.57752),
      LatLng(45.49456, -73.57733),
      LatLng(45.49465, -73.57722),
      LatLng(45.4947, -73.5773),
      LatLng(45.49469, -73.57731),
      LatLng(45.49471, -73.57735),
      LatLng(45.49477, -73.57745),
      LatLng(45.49476, -73.57747),
      LatLng(45.49481, -73.57754),
      LatLng(45.4948, -73.57755),
      LatLng(45.49484, -73.57763),
      LatLng(45.49484, -73.57763),
      LatLng(45.49488, -73.57771),
      LatLng(45.49487, -73.57771),
    ],
    "JMSB": [
      LatLng(45.49529, -73.57923),
      LatLng(45.49537, -73.57937),
      LatLng(45.49541, -73.57933),
      LatLng(45.49546, -73.57927),
      LatLng(45.49553, -73.5792),
      LatLng(45.49551, -73.57914),
      LatLng(45.49549, -73.57908),
      LatLng(45.49545, -73.57896),
      LatLng(45.4952, -73.57853),
      LatLng(45.49501, -73.57874),
      LatLng(45.49505, -73.57879),
      LatLng(45.49501, -73.57882),
      LatLng(45.49505, -73.57889),
      LatLng(45.49511, -73.57903),
      LatLng(45.49518, -73.57917),
      LatLng(45.49523, -73.57911),
    ],
    "GM": [
      LatLng(45.49605, -73.5789),
      LatLng(45.49613, -73.57881),
      LatLng(45.49595, -73.57844),
      LatLng(45.49594, -73.57845),
      LatLng(45.49596, -73.5785),
      LatLng(45.4958, -73.57866),
      LatLng(45.49569, -73.57876),
      LatLng(45.49563, -73.57877),
      LatLng(45.49571, -73.57893),
      LatLng(45.49579, -73.57909),
      LatLng(45.49577, -73.57911),
      LatLng(45.49579, -73.57915),
      LatLng(45.49597, -73.57897),
    ],
    "EV": [
      LatLng(45.49534, -73.57802),
      LatLng(45.49569, -73.57876),
      LatLng(45.49596, -73.5785),
      LatLng(45.49573, -73.57802),
      LatLng(45.49605, -73.57771),
      LatLng(45.49583, -73.57725),
      LatLng(45.49554, -73.57753),
      LatLng(45.49555, -73.57756),
      LatLng(45.4955, -73.57761),
      LatLng(45.49554, -73.57761),
      LatLng(45.49545, -73.5777),
      LatLng(45.49545, -73.57774),
      LatLng(45.49539, -73.5778),
      LatLng(45.49533, -73.57788),
      LatLng(45.49533, -73.57791),
      LatLng(45.49534, -73.57792),
      LatLng(45.49535, -73.57797),
      LatLng(45.49536, -73.578),
    ],
    "GN": [
      LatLng(45.49398, -73.57756),
      LatLng(45.49403, -73.5775),
      LatLng(45.49413, -73.57741),
      LatLng(45.49409, -73.57735),
      LatLng(45.49422, -73.57722),
      LatLng(45.49439, -73.57706),
      LatLng(45.49432, -73.57691),
      LatLng(45.49422, -73.5767),
      LatLng(45.49408, -73.57641),
      LatLng(45.49402, -73.57628),
      LatLng(45.49412, -73.57618),
      LatLng(45.49403, -73.576),
      LatLng(45.49393, -73.5761),
      LatLng(45.49382, -73.57587),
      LatLng(45.49371, -73.57564),
      LatLng(45.49357, -73.57578),
      LatLng(45.49364, -73.57592),
      LatLng(45.49379, -73.57625),
      LatLng(45.49349, -73.57654),
      LatLng(45.49347, -73.5765),
      LatLng(45.49342, -73.57655),
      LatLng(45.49334, -73.57662),
      LatLng(45.49337, -73.57667),
      LatLng(45.49321, -73.57683),
      LatLng(45.49303, -73.57701),
      LatLng(45.49294, -73.57683),
      LatLng(45.49295, -73.57679),
      LatLng(45.49293, -73.57675),
      LatLng(45.4929, -73.57674),
      LatLng(45.49286, -73.57666),
      LatLng(45.49282, -73.57657),
      LatLng(45.49273, -73.5764),
      LatLng(45.49259, -73.57653),
      LatLng(45.49261, -73.57658),
      LatLng(45.49261, -73.57658),
      LatLng(45.49275, -73.57687),
      LatLng(45.49273, -73.57687),
      LatLng(45.49268, -73.57692),
      LatLng(45.49268, -73.57696),
      LatLng(45.49271, -73.57703),
      LatLng(45.49277, -73.57697),
      LatLng(45.49279, -73.57698),
      LatLng(45.49281, -73.57696),
      LatLng(45.4929, -73.57714),
      LatLng(45.49284, -73.5772),
      LatLng(45.49293, -73.57738),
      LatLng(45.49299, -73.57731),
      LatLng(45.49309, -73.57751),
      LatLng(45.4932, -73.5774),
      LatLng(45.49311, -73.57721),
      LatLng(45.49326, -73.57706),
      LatLng(45.49336, -73.57696),
      LatLng(45.49335, -73.57694),
      LatLng(45.49344, -73.57685),
      LatLng(45.49348, -73.57694),
      LatLng(45.49345, -73.57696),
      LatLng(45.49353, -73.57713),
      LatLng(45.49358, -73.57708),
      LatLng(45.4936, -73.57713),
      LatLng(45.49358, -73.57715),
      LatLng(45.49364, -73.57727),
      LatLng(45.49375, -73.57716),
      LatLng(45.49367, -73.577),
      LatLng(45.49373, -73.57694),
      LatLng(45.49367, -73.57682),
      LatLng(45.49361, -73.57688),
      LatLng(45.49355, -73.57675),
      LatLng(45.4937, -73.5766),
      LatLng(45.4938, -73.5765),
      LatLng(45.4939, -73.57641),
      LatLng(45.494, -73.57663),
      LatLng(45.49413, -73.57688),
      LatLng(45.49419, -73.57702),
      LatLng(45.49387, -73.57734),
    ],
    "GN2": [
      LatLng(45.4939, -73.57717),
      LatLng(45.49406, -73.57702),
      LatLng(45.4939, -73.57666),
      LatLng(45.49384, -73.57667),
      LatLng(45.49372, -73.57678),
    ],
    "Q": [
      LatLng(45.49668, -73.57934),
      LatLng(45.49662, -73.5794),
      LatLng(45.49666, -73.57948),
      LatLng(45.49672, -73.57942),
      LatLng(45.49675, -73.57949),
      LatLng(45.49674, -73.5795),
      LatLng(45.49678, -73.57958),
      LatLng(45.49684, -73.57953),
      LatLng(45.49688, -73.57949),
      LatLng(45.49686, -73.57944),
      LatLng(45.49684, -73.57941),
      LatLng(45.49685, -73.5794),
      LatLng(45.49681, -73.57933),
      LatLng(45.49681, -73.57933),
      LatLng(45.49677, -73.57925),
      LatLng(45.49676, -73.57926),
      LatLng(45.49672, -73.57918),
      LatLng(45.49673, -73.57917),
      LatLng(45.49669, -73.57908),
      LatLng(45.49668, -73.57908),
      LatLng(45.49667, -73.57905),
      LatLng(45.49665, -73.57902),
      LatLng(45.49663, -73.57905),
      LatLng(45.49656, -73.57912),
    ],
    "VA": [
      LatLng(45.49568, -73.57431),
      LatLng(45.49602, -73.57397),
      LatLng(45.49616, -73.57383),
      LatLng(45.4962, -73.5738),
      LatLng(45.49608, -73.57356),
      LatLng(45.49593, -73.57371),
      LatLng(45.49583, -73.57381),
      LatLng(45.49578, -73.57372),
      LatLng(45.49567, -73.5735),
      LatLng(45.49556, -73.57362),
      LatLng(45.49551, -73.57367),
      LatLng(45.49546, -73.57372),
      LatLng(45.49541, -73.57377),
      LatLng(45.49546, -73.57386),
      LatLng(45.49551, -73.57396),
      LatLng(45.49556, -73.57406),
      LatLng(45.49563, -73.5742),
    ],
    "CB": [
      LatLng(45.49506, -73.57452),
      LatLng(45.4954, -73.57419),
      LatLng(45.49536, -73.57411),
      LatLng(45.49532, -73.57402),
      LatLng(45.49524, -73.57386),
      LatLng(45.49516, -73.57393),
      LatLng(45.4952, -73.574),
      LatLng(45.49514, -73.57405),
      LatLng(45.49511, -73.57399),
      LatLng(45.49503, -73.57407),
      LatLng(45.49506, -73.57413),
      LatLng(45.495, -73.57419),
      LatLng(45.49501, -73.5742),
      LatLng(45.49494, -73.57427),
      LatLng(45.49501, -73.57441),
    ],
    "CL": [
      LatLng(45.49418, -73.57966),
      LatLng(45.49448, -73.57928),
      LatLng(45.49437, -73.5791),
      LatLng(45.49427, -73.57894),
      LatLng(45.49421, -73.57901),
      LatLng(45.49412, -73.57912),
      LatLng(45.49404, -73.57921),
      LatLng(45.49402, -73.57925),
      LatLng(45.494, -73.57929),
      LatLng(45.49399, -73.57933),
      LatLng(45.49399, -73.57935),
      LatLng(45.49405, -73.57944),
    ],
    "SB": [
      LatLng(45.49651, -73.58621),
      LatLng(45.49645, -73.58621),
      LatLng(45.49647, -73.58574),
      LatLng(45.4965, -73.58574),
      LatLng(45.49652, -73.58578),
      LatLng(45.49652, -73.58579),
      LatLng(45.49656, -73.58579),
      LatLng(45.49658, -73.58584),
      LatLng(45.49659, -73.58583),
      LatLng(45.49667, -73.58601),
      LatLng(45.49666, -73.58601),
      LatLng(45.49669, -73.58609),
      LatLng(45.49662, -73.58615),
      LatLng(45.49654, -73.58621),
      LatLng(45.49654, -73.58621),
      LatLng(45.49653, -73.58617),
      LatLng(45.49653, -73.58614),
      LatLng(45.49651, -73.58614),
      LatLng(45.49652, -73.58611),
      LatLng(45.49652, -73.58608),
      LatLng(45.49655, -73.58608),
      LatLng(45.49655, -73.58603),
      LatLng(45.49659, -73.586),
      LatLng(45.49657, -73.58595),
      LatLng(45.49655, -73.58592),
      LatLng(45.49653, -73.58592),
      LatLng(45.49652, -73.58599),
      LatLng(45.49652, -73.58606),
    ],
    "AD": [
      LatLng(45.45827, -73.63945),
      LatLng(45.45838, -73.63977),
      LatLng(45.4583, -73.63983),
      LatLng(45.45828, -73.63978),
      LatLng(45.45817, -73.63986),
      LatLng(45.45817, -73.63987),
      LatLng(45.4581, -73.63993),
      LatLng(45.45809, -73.63992),
      LatLng(45.45797, -73.64001),
      LatLng(45.458, -73.64007),
      LatLng(45.45791, -73.64013),
      LatLng(45.4578, -73.63982),
      LatLng(45.45788, -73.63975),
      LatLng(45.4579, -73.63981),
      LatLng(45.45791, -73.6398),
      LatLng(45.45792, -73.63983),
      LatLng(45.45802, -73.63975),
      LatLng(45.45802, -73.63974),
      LatLng(45.45798, -73.63963),
      LatLng(45.45805, -73.63957),
      LatLng(45.45809, -73.63969),
      LatLng(45.45811, -73.63969),
      LatLng(45.4582, -73.63962),
      LatLng(45.45819, -73.63958),
      LatLng(45.4582, -73.63957),
      LatLng(45.45818, -73.63952),
    ],
    "BB": [
      LatLng(45.45979, -73.63909),
      LatLng(45.45982, -73.63917),
      LatLng(45.45973, -73.63925),
      LatLng(45.4597, -73.63917),
    ],
    "BH": [
      LatLng(45.45979, -73.63909),
      LatLng(45.45976, -73.63901),
      LatLng(45.45966, -73.63909),
      LatLng(45.4597, -73.63917),
    ],
    "CC": [
      LatLng(45.45823, -73.6399),
      LatLng(45.45832, -73.64014),
      LatLng(45.45833, -73.64014),
      LatLng(45.45845, -73.64044),
      LatLng(45.45844, -73.64045),
      LatLng(45.45853, -73.64069),
      LatLng(45.45838, -73.6408),
      LatLng(45.45829, -73.64056),
      LatLng(45.45828, -73.64056),
      LatLng(45.45817, -73.64026),
      LatLng(45.45817, -73.64026),
      LatLng(45.45808, -73.64001),
    ],
    "CJ": [
      LatLng(45.45748, -73.63981),
      LatLng(45.45746, -73.63996),
      LatLng(45.45745, -73.63995),
      LatLng(45.45744, -73.64003),
      LatLng(45.45749, -73.64015),
      LatLng(45.45762, -73.64004),
      LatLng(45.45773, -73.64031),
      LatLng(45.45775, -73.64029),
      LatLng(45.45783, -73.64049),
      LatLng(45.45765, -73.64063),
      LatLng(45.4576, -73.6405),
      LatLng(45.45733, -73.64072),
      LatLng(45.4573, -73.64064),
      LatLng(45.45728, -73.64066),
      LatLng(45.45718, -73.64039),
      LatLng(45.45741, -73.64021),
      LatLng(45.45736, -73.64008),
      LatLng(45.45731, -73.64005),
      LatLng(45.45731, -73.64007),
      LatLng(45.45721, -73.64002),
      LatLng(45.45721, -73.63999),
      LatLng(45.45723, -73.63988),
      LatLng(45.45726, -73.63983),
      LatLng(45.45728, -73.6398),
      LatLng(45.45733, -73.63977),
      LatLng(45.45736, -73.63976),
      LatLng(45.45741, -73.63976),
      LatLng(45.45743, -73.63977),
    ],
    "DO": [
      LatLng(45.45793, -73.63523),
      LatLng(45.45834, -73.63596),
      LatLng(45.45737, -73.6371),
      LatLng(45.45695, -73.63636),
    ],
    "FC": [
      LatLng(45.45876, -73.63957),
      LatLng(45.45875, -73.63962),
      LatLng(45.45867, -73.63969),
      LatLng(45.45863, -73.63967),
      LatLng(45.4586, -73.63959),
      LatLng(45.45859, -73.6396),
      LatLng(45.45858, -73.63958),
      LatLng(45.45856, -73.6396),
      LatLng(45.45854, -73.63959),
      LatLng(45.45853, -73.63956),
      LatLng(45.45853, -73.63954),
      LatLng(45.45853, -73.63952),
      LatLng(45.45852, -73.63952),
      LatLng(45.45851, -73.63952),
      LatLng(45.4585, -73.63949),
      LatLng(45.4585, -73.63948),
      LatLng(45.45849, -73.63945),
      LatLng(45.45851, -73.63942),
      LatLng(45.45851, -73.63941),
      LatLng(45.45852, -73.63941),
      LatLng(45.45846, -73.63925),
      LatLng(45.45844, -73.63926),
      LatLng(45.45842, -73.63919),
      LatLng(45.45843, -73.63918),
      LatLng(45.45842, -73.63916),
      LatLng(45.45843, -73.63916),
      LatLng(45.45841, -73.6391),
      LatLng(45.45843, -73.63909),
      LatLng(45.45842, -73.63906),
      LatLng(45.45839, -73.63907),
      LatLng(45.45838, -73.63904),
      LatLng(45.45852, -73.63893),
      LatLng(45.45853, -73.63897),
      LatLng(45.45851, -73.63898),
      LatLng(45.45852, -73.63901),
      LatLng(45.45854, -73.639),
      LatLng(45.45856, -73.63905),
      LatLng(45.45857, -73.63905),
      LatLng(45.45858, -73.63905),
      LatLng(45.45858, -73.63906),
      LatLng(45.45859, -73.63906),
      LatLng(45.45861, -73.63907),
      LatLng(45.45863, -73.6391),
      LatLng(45.45862, -73.63913),
      LatLng(45.45861, -73.63914),
      LatLng(45.45867, -73.63929),
      LatLng(45.45868, -73.63929),
      LatLng(45.45869, -73.63931),
      LatLng(45.4587, -73.6393),
      LatLng(45.4587, -73.6393),
      LatLng(45.45871, -73.63931),
      LatLng(45.45873, -73.63929),
      LatLng(45.45875, -73.63933),
      LatLng(45.45872, -73.63935),
      LatLng(45.45873, -73.63936),
      LatLng(45.45871, -73.63937),
      LatLng(45.45873, -73.63941),
      LatLng(45.45872, -73.63942),
      LatLng(45.45874, -73.63949),
      LatLng(45.45873, -73.6395),
    ],
    "GE": [
      LatLng(45.45704, -73.64016),
      LatLng(45.45714, -73.64044),
      LatLng(45.45713, -73.64045),
      LatLng(45.45717, -73.64057),
      LatLng(45.45695, -73.64074),
      LatLng(45.45692, -73.64067),
      LatLng(45.45689, -73.64069),
      LatLng(45.45687, -73.64063),
      LatLng(45.4569, -73.64061),
      LatLng(45.4568, -73.64034),
    ],
    "HA": [
      LatLng(45.45949, -73.64088),
      LatLng(45.45951, -73.64094),
      LatLng(45.45953, -73.64093),
      LatLng(45.45967, -73.64128),
      LatLng(45.45965, -73.64129),
      LatLng(45.45968, -73.64135),
      LatLng(45.45943, -73.64154),
      LatLng(45.45941, -73.64149),
      LatLng(45.4594, -73.6415),
      LatLng(45.45926, -73.64115),
      LatLng(45.45928, -73.64113),
      LatLng(45.45925, -73.64107),
    ],
    "HB": [
      LatLng(45.45921, -73.64168),
      LatLng(45.45937, -73.64207),
      LatLng(45.45934, -73.64209),
      LatLng(45.45936, -73.64215),
      LatLng(45.45917, -73.64231),
      LatLng(45.45914, -73.64225),
      LatLng(45.4591, -73.64227),
      LatLng(45.45896, -73.64191),
      LatLng(45.459, -73.64189),
      LatLng(45.45897, -73.64181),
      LatLng(45.45917, -73.64165),
      LatLng(45.45919, -73.6417),
    ],
    "HC": [
      LatLng(45.45983, -73.64183),
      LatLng(45.4599, -73.64201),
      LatLng(45.45979, -73.6421),
      LatLng(45.4598, -73.64213),
      LatLng(45.45962, -73.64228),
      LatLng(45.45952, -73.64202),
      LatLng(45.4597, -73.64187),
      LatLng(45.45972, -73.64191),
    ],
    "HU": [
      LatLng(45.45864, -73.64141),
      LatLng(45.45892, -73.64206),
      LatLng(45.45853, -73.64236),
      LatLng(45.45826, -73.64171),
    ],
    "JR": [
      LatLng(45.45854, -73.64305),
      LatLng(45.45857, -73.64313),
      LatLng(45.45858, -73.64312),
      LatLng(45.45862, -73.64322),
      LatLng(45.45861, -73.64324),
      LatLng(45.45864, -73.64331),
      LatLng(45.45857, -73.64337),
      LatLng(45.45856, -73.64335),
      LatLng(45.45849, -73.6434),
      LatLng(45.45847, -73.64333),
      LatLng(45.45845, -73.64334),
      LatLng(45.45841, -73.64324),
      LatLng(45.45842, -73.64323),
      LatLng(45.4584, -73.64315),
      LatLng(45.45847, -73.64309),
      LatLng(45.45848, -73.64312),
      LatLng(45.45849, -73.64311),
      LatLng(45.45848, -73.6431),
    ],
    "PC": [
      LatLng(45.45696, -73.63676),
      LatLng(45.45729, -73.63763),
      LatLng(45.45702, -73.63784),
      LatLng(45.45668, -73.63698),
    ],
    "PS": [
      LatLng(45.45958, -73.63922),
      LatLng(45.45963, -73.63934),
      LatLng(45.45967, -73.63931),
      LatLng(45.45999, -73.64014),
      LatLng(45.45986, -73.64024),
      LatLng(45.45985, -73.64021),
      LatLng(45.45971, -73.64032),
      LatLng(45.45964, -73.64014),
      LatLng(45.45961, -73.64017),
      LatLng(45.45941, -73.63966),
      LatLng(45.45944, -73.63963),
      LatLng(45.4594, -73.63953),
      LatLng(45.45933, -73.63959),
      LatLng(45.45928, -73.63946),
    ],
    "PT": [
      LatLng(45.45931, -73.63867),
      LatLng(45.45949, -73.63914),
      LatLng(45.45936, -73.63924),
      LatLng(45.45935, -73.63921),
      LatLng(45.45933, -73.63923),
      LatLng(45.45932, -73.63918),
      LatLng(45.45927, -73.63922),
      LatLng(45.45931, -73.63932),
      LatLng(45.45923, -73.63939),
      LatLng(45.45921, -73.63934),
      LatLng(45.45911, -73.63943),
      LatLng(45.45899, -73.63912),
      LatLng(45.45909, -73.63904),
      LatLng(45.45908, -73.63899),
      LatLng(45.45914, -73.63895),
      LatLng(45.45916, -73.63898),
      LatLng(45.45922, -73.63893),
      LatLng(45.4592, -73.63889),
      LatLng(45.45909, -73.63897),
      LatLng(45.45905, -73.63887),
      LatLng(45.45885, -73.63903),
      LatLng(45.45863, -73.63847),
      LatLng(45.45871, -73.6384),
      LatLng(45.4587, -73.63836),
      LatLng(45.45886, -73.63824),
      LatLng(45.45885, -73.6382),
      LatLng(45.45888, -73.63817),
      LatLng(45.45887, -73.63813),
      LatLng(45.4589, -73.6381),
      LatLng(45.45888, -73.63805),
      LatLng(45.45891, -73.63803),
      LatLng(45.4589, -73.638),
      LatLng(45.45904, -73.63789),
      LatLng(45.45905, -73.63791),
      LatLng(45.45908, -73.63789),
      LatLng(45.45907, -73.63787),
      LatLng(45.45911, -73.63784),
      LatLng(45.45922, -73.63813),
      LatLng(45.45914, -73.6382),
      LatLng(45.45932, -73.63866),
    ],
    "PY": [
      LatLng(45.45909, -73.64015),
      LatLng(45.45925, -73.64059),
      LatLng(45.4592, -73.64063),
      LatLng(45.45918, -73.64058),
      LatLng(45.45885, -73.64084),
      LatLng(45.4588, -73.64071),
      LatLng(45.45882, -73.64069),
      LatLng(45.45873, -73.64045),
      LatLng(45.45876, -73.64042),
      LatLng(45.45876, -73.6404),
      LatLng(45.45899, -73.64021),
      LatLng(45.459, -73.64024),
      LatLng(45.45903, -73.64022),
      LatLng(45.45902, -73.64021),
    ],
    "RA": [
      LatLng(45.45691, -73.63756),
      LatLng(45.45703, -73.63787),
      LatLng(45.45697, -73.63793),
      LatLng(45.45702, -73.63806),
      LatLng(45.45685, -73.6382),
      LatLng(45.4568, -73.63807),
      LatLng(45.45669, -73.63815),
      LatLng(45.45639, -73.63737),
      LatLng(45.45673, -73.63709),
    ],
    "RF": [
      LatLng(45.45869, -73.6408),
      LatLng(45.45877, -73.64104),
      LatLng(45.45879, -73.64103),
      LatLng(45.45882, -73.64113),
      LatLng(45.45881, -73.64115),
      LatLng(45.45881, -73.64116),
      LatLng(45.45865, -73.64129),
      LatLng(45.45864, -73.64127),
      LatLng(45.45851, -73.64138),
      LatLng(45.45848, -73.64132),
      LatLng(45.45854, -73.64128),
      LatLng(45.45853, -73.64125),
      LatLng(45.45855, -73.64123),
      LatLng(45.45851, -73.64114),
      LatLng(45.45843, -73.6412),
      LatLng(45.45838, -73.64108),
      LatLng(45.45847, -73.64101),
      LatLng(45.45841, -73.64085),
      LatLng(45.45854, -73.64075),
      LatLng(45.45859, -73.64088),
    ],
    "SH": [
      LatLng(45.45933, -73.64237),
      LatLng(45.45933, -73.64256),
      LatLng(45.45926, -73.64256),
      LatLng(45.45925, -73.64237),
    ],
    "SI": [
      LatLng(45.4581, -73.64241),
      LatLng(45.45812, -73.6424),
      LatLng(45.45817, -73.64252),
      LatLng(45.45796, -73.64268),
      LatLng(45.45791, -73.64256),
      LatLng(45.45794, -73.64254),
      LatLng(45.45791, -73.64248),
      LatLng(45.45786, -73.64252),
      LatLng(45.45784, -73.64249),
      LatLng(45.45779, -73.64253),
      LatLng(45.45778, -73.6425),
      LatLng(45.45774, -73.64254),
      LatLng(45.45773, -73.64251),
      LatLng(45.45766, -73.64257),
      LatLng(45.45766, -73.64256),
      LatLng(45.45763, -73.64258),
      LatLng(45.45757, -73.64239),
      LatLng(45.45763, -73.64235),
      LatLng(45.45762, -73.64233),
      LatLng(45.45764, -73.64232),
      LatLng(45.45763, -73.6423),
      LatLng(45.45764, -73.64229),
      LatLng(45.45765, -73.6423),
      LatLng(45.45769, -73.64227),
      LatLng(45.45768, -73.64224),
      LatLng(45.45773, -73.6422),
      LatLng(45.45772, -73.64218),
      LatLng(45.45777, -73.64213),
      LatLng(45.45776, -73.6421),
      LatLng(45.45783, -73.64205),
      LatLng(45.45782, -73.64202),
      LatLng(45.45786, -73.64199),
      LatLng(45.45788, -73.64205),
      LatLng(45.45794, -73.642),
      LatLng(45.45797, -73.64208),
      LatLng(45.458, -73.64208),
      LatLng(45.45806, -73.64223),
      LatLng(45.45805, -73.64227),
    ],
    "SP": [
      LatLng(45.4572, -73.64065),
      LatLng(45.45753, -73.64147),
      LatLng(45.4579, -73.64117),
      LatLng(45.45789, -73.64113),
      LatLng(45.45798, -73.64106),
      LatLng(45.458, -73.64111),
      LatLng(45.45832, -73.64085),
      LatLng(45.45834, -73.64093),
      LatLng(45.4582, -73.64104),
      LatLng(45.45826, -73.6412),
      LatLng(45.45818, -73.64127),
      LatLng(45.45821, -73.64133),
      LatLng(45.45828, -73.64128),
      LatLng(45.45833, -73.64142),
      LatLng(45.45767, -73.64193),
      LatLng(45.45764, -73.64185),
      LatLng(45.45744, -73.64201),
      LatLng(45.45721, -73.64141),
      LatLng(45.45718, -73.64143),
      LatLng(45.45717, -73.64139),
      LatLng(45.45718, -73.64138),
      LatLng(45.45715, -73.6413),
      LatLng(45.45716, -73.64129),
      LatLng(45.45704, -73.641),
      LatLng(45.45702, -73.64101),
      LatLng(45.45699, -73.64096),
      LatLng(45.45702, -73.64093),
      LatLng(45.45698, -73.64083),
    ],
    "TA": [
      LatLng(45.46005, -73.64079),
      LatLng(45.46008, -73.64089),
      LatLng(45.45998, -73.64097),
      LatLng(45.45994, -73.64087),
    ],
  };

  void addPolygons() {
    buildings.forEach((id, points) {
      allPolygons.add(
        Polygon(
          polygonId: PolygonId(id),
          fillColor: Color(0xFF73C700).withOpacity(0.3),
          consumeTapEvents: false,
          geodesic: false,
          points: points,
          strokeWidth: 0,
          strokeColor: Colors.transparent,
        ),
      );
    });
  }

  void clearPolygons() {
    allPolygons.clear();
  }
}
