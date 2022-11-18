import 'package:flutter/foundation.dart';

import '../../models/cart_item.dart';
import '../../models/order_item.dart';

class OrdersManager with ChangeNotifier {
  final List<OrderItem> _orders = [
    // OrderItem(
    //   id: 'o1',
    //   amount: 59.98,
    //   products: [
    //    CartItem(
    //     id: 'c1',
    //     title: 'Salad hoa quả',
    //     price: 40.000,
    //     imageUrl:
    //         'https://img.tastykitchen.vn/resize/764x-/2021/05/31/trai-cay-cung-cap-nguon-dinh-duong-doi-dao-tuoi-ma-861d.jpg',
    //     quantity: 2),
    //   ],
    //   dateTime: DateTime.now(),
    // )
  ];
  void addOrder(List<CartItem> cartProducts, double total) async {
    _orders.insert(
      0,
      OrderItem(
        id: 'o${DateTime.now().toIso8601String()}',
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  int get orderCount {
    return _orders.length;
  }

  List<OrderItem> get orders {
    return [..._orders];
  }
}
