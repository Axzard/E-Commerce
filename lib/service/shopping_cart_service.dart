import 'dart:convert';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

class ShoppingCartService {
  static const String _cartKey = 'shopping_cart';

  /// Simpan seluruh cart ke SharedPreferences
  static Future<void> saveCart(List<ProductModel> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedItems = cartItems.map((item) => jsonEncode({
          'name': item.name,
          'price': item.price,
          'image': item.image,
          'unit': item.unit,
          'isFav': item.isFav,
          'isNew': item.isNew,
          'bgColor': item.bgColor.value, // simpan nilai warna dalam int
        })).toList();

    await prefs.setStringList(_cartKey, encodedItems);
  }

  /// Ambil data cart dari SharedPreferences
  static Future<List<ProductModel>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? encodedItems = prefs.getStringList(_cartKey);

    if (encodedItems == null) return [];

    return encodedItems.map((e) {
      final Map<String, dynamic> data = jsonDecode(e);
      return ProductModel(
        name: data['name'],
        price: data['price'],
        image: data['image'],
        unit: data['unit'],
        isFav: data['isFav'],
        isNew: data['isNew'],
        bgColor: Color(data['bgColor']),
      );
    }).toList();
  }

  /// Tambahkan satu produk ke cart
  static Future<void> addToCart(ProductModel product) async {
    List<ProductModel> cart = await loadCart();
    cart.add(product);
    await saveCart(cart);
  }

  /// Hapus satu produk dari cart berdasarkan nama
  static Future<void> removeFromCart(String productName) async {
    List<ProductModel> cart = await loadCart();
    cart.removeWhere((item) => item.name == productName);
    await saveCart(cart);
  }

  /// Hapus semua item cart
  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
