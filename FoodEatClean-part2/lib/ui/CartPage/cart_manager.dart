import 'package:flutter/foundation.dart';

import '../../models/product.dart';
import '../../models/cart_item.dart';

class CartManager with ChangeNotifier {
  Map<String, CartItem> _items = {
    'p1': CartItem(
        id: 'c1',
        title: 'Salad hoa quả',
        price: 40.000,
        imageUrl:
            'https://img.tastykitchen.vn/resize/764x-/2021/05/31/trai-cay-cung-cap-nguon-dinh-duong-doi-dao-tuoi-ma-861d.jpg',
        quantity: 2),
    'p2': CartItem(
      id: 'c2',
      title: 'Cá hồi rán',
      price: 40.000,
      quantity: 2,
      imageUrl:
          'https://cdn2.tieudungplus.vn/media/uploaded/26/2018/06/08/thuc-don-an-kieng-eat-clean-tieudungplus-5-tieudungplus-1528455450.jpg',
    ),
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

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      // thay doi gia tri
      _items.update(
          product.id!,
          (existingCartItem) => existingCartItem.copyWith(
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          price: product.price,
          imageUrl: product.imageUrl,
          quantity: 1,
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

  // void clear(){
  //   _items = {};
  //   notifyListeners();
  // }
}
