import 'package:eatcleanproject/ui/orders/app_bar_order.dart';
import 'package:eatcleanproject/ui/orders/order_item_card.dart';
import 'package:eatcleanproject/ui/orders/order_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building orders');
    final ordersManager = OrdersManager();
    return Scaffold(
        body: Column(
      children: [
        AppBarOrder(),
        Expanded(
            child: SingleChildScrollView(
                child: Container(
          height: 1000,
          child: Consumer<OrdersManager>(
            builder: (context, ordersManager, child) {
              return ListView.builder(
                itemCount: ordersManager.orderCount,
                itemBuilder: (ctx, i) => OrderItemCard(ordersManager.orders[i]),
              );
            },
          ),
        )))
      ],
    ));
  }
}
