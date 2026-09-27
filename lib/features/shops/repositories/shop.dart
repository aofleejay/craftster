import 'package:craftster/features/shops/models/shop.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ShopRepository {
  Future<List<Shop>> getShops() async {
    final response = await Supabase.instance.client.rpc('get_shops');

    final List<dynamic> data = response as List<dynamic>;
    return data.map((shopJson) => Shop.fromJson(shopJson)).toList();
  }
}
