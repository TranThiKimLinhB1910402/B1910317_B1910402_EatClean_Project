import 'package:flutter/foundation.dart';

import '../../models/product.dart';
import '../../models/cart_item.dart';

class CartManager with ChangeNotifier {
  // ignore: prefer_final_fields
  Map<String, CartItem> _items = {
  };

  int get productCount {
    return _items.length;
  }

  List<CartItem> get products {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, CartItem>> get productEntries {
    return {..._items}.entries;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product, n) {
    int num = n;
    if (_items.containsKey(product.id)) {
      // thay doi gia tri
      _items.update(
          product.id!,
          (existingCartItem) => existingCartItem.copyWith(
                quantity: existingCartItem.quantity + num,
              ));
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          price: product.price,
          imageUrl: product.imageUrl,
          quantity: n,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  // void removeSingleItem(String productId) {
  //   if (!_items.containsKey(productId)) {
  //     return;
  //   }
  //   if (_items[productId]?.quantity as num > 1) {
  //     _items.update(
  //         productId,
  //         (existingCartItem) => existingCartItem.copyWith(
  //               quantity: existingCartItem.quantity - 1,
  //         )
  //       );
  //   }
  //   else{
  //     _items.remove(productId);
  //   }
  //   notifyListeners();
  // }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
