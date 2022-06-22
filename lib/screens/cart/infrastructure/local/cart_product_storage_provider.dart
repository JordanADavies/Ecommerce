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

  Future<Box<Map<String, dynamic>>> _openBox() async {
    if (Hive.isBoxOpen(cartProductBoxName)) {
      return Hive.box<Map<String, dynamic>>(cartProductBoxName);
    }

    return await Hive.openBox<Map<String, dynamic>>(cartProductBoxName);
  }

  Future<void> removeProduct({
    required int id,
  }) async {
    final box = await _openBox();
    await box.delete(id);
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final box = await _openBox();
    return box.isNotEmpty ? box.values.toList() : [];
  }
}
