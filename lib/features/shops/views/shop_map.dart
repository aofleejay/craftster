import 'dart:convert';

import 'package:craftster/features/shops/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:maplibre/maplibre.dart';

class ShopMap extends StatelessWidget {
  final List<Shop> shops;
  const ShopMap({super.key, required this.shops});

  @override
  Widget build(BuildContext context) {
    return MapLibreMap(
      options: MapOptions(
        initCenter: Geographic(lon: 100.5018, lat: 13.7563),
        initZoom: 5, // Bangkok coordinates
      ),
      onStyleLoaded: (style) async {
        await style.addSource(
          GeoJsonSource(
            id: 'shops-source',
            data: jsonEncode({
              'type': 'FeatureCollection',
              'features': shops.map((shop) {
                return {
                  'type': 'Feature',
                  'geometry': {
                    'type': 'Point',
                    'coordinates': [shop.longitude, shop.latitude],
                  },
                };
              }).toList(),
            }),
          ),
        );

        await style.addLayer(
          CircleStyleLayer(id: 'shops-circle-layer', sourceId: 'shops-source'),
        );
      },
    );
  }
}
