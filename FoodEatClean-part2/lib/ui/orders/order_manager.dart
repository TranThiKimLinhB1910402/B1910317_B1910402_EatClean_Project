import 'package:eatcleanproject/models/auth_token.dart';
import 'package:eatcleanproject/services/order_service.dart';
import 'package:flutter/foundation.dart';

import '../../models/cart_item.dart';
import '../../models/order_item.dart';

class OrdersManager with ChangeNotifier {
   List<OrderItem> _items = [];

  final OrderService _orderService;

  OrdersManager([AuthToken? authToken])
      : _orderService = OrderService(authToken);

  set authToken(AuthToken? authToken) {
    _orderService.authToken = authToken;
  }
 Future<void> fetchOrders([bool filterByUser = false]) async {
    _items = await _orderService.fetchOrders(filterByUser);
    notifyListeners();
  }
  Future<void> addOrder(OrderItem orderItem) async {
    final newOrder = await _orderService.addOrder(orderItem);
    if (newOrder != null) {
      _items.add(newOrder);
      notifyListeners();
    }
  }

  // void addOrderTest(List<CartItem> cartProducts, double total, String fullname,
  //     String phone, String address) async {
  //   _items.insert(
  //     0,
  //     OrderItem(
  //         id: 'o${DateTime.now().toIso8601String()}',
  //         amount: total,
  //         products: cartProducts,
  //         dateTime: DateTime.now(),
  //         full_name: fullname,
  //         phone: phone,
  //         address: address),
  //   );
  //   notifyListeners();
  // }

  int get orderCount {
    return _items.length;
  }

  List<OrderItem> get items {
    return [..._items];
  }
}
