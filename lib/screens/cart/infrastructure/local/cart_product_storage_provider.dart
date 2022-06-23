import 'package:hive/hive.dart';

const cartProductBoxName = 'cart_products';

class CartProductStorageProvider {
  Future<void> saveProduct({
    required int id,
    required Map<String, dynamic> product,
  }) async {
    final box = await _openBox();
    await box.put(id, product);
  }

  Future<Box<Map>> _openBox() async {
    if (Hive.isBoxOpen(cartProductBoxName)) {
      return Hive.box<Map>(cartProductBoxName);
    }

    return await Hive.openBox<Map>(cartProductBoxName);
  }

  Future<void> removeProduct({
    required int id,
  }) async {
    final box = await _openBox();
    await box.delete(id);
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final box = await _openBox();
    var productMaps = <Map<String, dynamic>>[];
    for (int key in box.keys) {
      final map = box.get(key)?.cast<String, dynamic>();
      if (map != null) productMaps.add(map);
    }
    return productMaps;
  }
}
