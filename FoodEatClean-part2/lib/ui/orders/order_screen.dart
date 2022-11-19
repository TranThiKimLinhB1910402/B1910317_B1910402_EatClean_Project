import 'package:eatcleanproject/ui/orders/app_bar_order.dart';
import 'package:eatcleanproject/ui/orders/order_item_card.dart';
import 'package:eatcleanproject/ui/orders/order_manager.dart';
import 'package:eatcleanproject/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersManager = OrdersManager();
    return Scaffold(
        body: Column(
      children: [
        AppBarOrder(
          title: 'Đơn đặt hàng',
          click: IconButton(
            padding: new EdgeInsets.all(0.0),
            icon: FaIcon(
              FontAwesomeIcons.comments,
              size: 21,
              color: Color.fromARGB(255, 13, 76, 33),
            ),
            color: Color.fromARGB(255, 170, 36, 10),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
          ),
        ),
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
