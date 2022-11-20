import '../../../models/product.dart';
import 'package:flutter/foundation.dart';
import '../../../services/product_service.dart';
import '../../../models/auth_token.dart';

class ProductManager with ChangeNotifier {
  List<Product> _items = [];

  final ProductService _productService;

  ProductManager([AuthToken? authToken])
      : _productService = ProductService(authToken);

  set authToken(AuthToken? authToken) {
    _productService.authToken = authToken;
  }

  Future<void> fetchProducts([bool filterByUser = false]) async {
    _items = await _productService.fetchProducts(filterByUser);
    // print(itemCount);
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    final newProduct = await _productService.addProduct(product);
    if (newProduct != null) {
      _items.add(newProduct);
      notifyListeners();
    }
  }

  Future<void> updateProduct(Product product) async {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      if (await _productService.updateProduct(product)) {
        _items[index] = product;
        notifyListeners();
      }
    }
  }

  Future<void> deleteProduct(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Product? existingProduct = _items[index];
    _items.removeAt(index);
    notifyListeners();
    if (!await _productService.deleteProduct(id)) {
      _items.insert(index, existingProduct);
      notifyListeners();
    }
  }

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((favItems) => favItems.isFavorite).toList();
  }

  List<Product> getSaladItems(String type) {
    return _items.where((saladItem) => saladItem.type == type).toList();
  }

  Product findById(String productId) {
    return _items.firstWhere((prodItem) => (prodItem.id == productId));
  }
}
