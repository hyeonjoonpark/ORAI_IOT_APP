import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildMap(LatLng currentLocation) {
  return FlutterMap(
    options: MapOptions(
      // currentLocation이 null이 아니면 currentLocation을 사용하고, null이면 서울의 좌표를 기본값으로 사용합니다.
      initialCenter: currentLocation,
      initialZoom: 13.0,
      maxZoom: 18.0,
      minZoom: 10.0,
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      ),
      RichAttributionWidget(
        attributions: [
          TextSourceAttribution(
            'OpenStreetMap 기여자들',
            onTap: () async {
              final Uri url = Uri.parse('https://www.openstreetmap.org');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
        ],
      ),
    ],
  );
}
