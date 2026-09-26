import 'package:craftster/shops/repositories/shop.dart';
import 'package:craftster/shops/views/shop_map.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ShopRepository().getShops(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading shops: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final shops = snapshot.data!;
          return ShopMap(shops: shops);
        },
      ),
    );
  }
}
