import 'dart:math';

import 'package:eatcleanproject/models/order_item.dart';

import '/ui/orders/app_bar_order.dart';
import '/ui/orders/order_item_card.dart';
import '/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late Future<void> _fetchOrders;
  @override
  void initState() {
    super.initState();
    _fetchOrders = context.read<OrdersManager>().fetchOrders();
  }

  // @override
  final ordersManager = OrdersManager();

  @override
  Widget build(BuildContext context) {
    final orders = context.select<OrdersManager, List<OrderItem>>(
        (ordersManager) => ordersManager.items);

    final ordersManager = OrdersManager();
    ChangeNotifierProvider(create: (context) => AuthManager());
    return Consumer<AuthManager>(builder: (context, authManager, child) {
      return Scaffold(
          body: Column(
        children: [
          AppBarOrder(
            title: 'Đơn đặt hàng',
            click: IconButton(
              padding: new EdgeInsets.all(0.0),
              icon: FaIcon(
                FontAwesomeIcons.house,
                size: 18,
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
              child: Consumer<OrdersManager>(
                builder: (context, ordersManager, child) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: ordersManager.orderCount,
                      itemBuilder: (ctx, i) {
                        if (authManager.authToken!.email ==
                            ordersManager.items[i].email) {
                          return OrderItemCard(
                            ordersManager.items[i],
                          );
                        } else if (authManager.authToken!.email ==
                                'ngoctran080901@gmail.com' ||
                            authManager.authToken!.email ==
                                'kimlinh@gmail.com') {
                          return OrderItemCard(ordersManager.items[i]);
                        }
                        return Container();
                      });
                },
              ),
            ),
          )
        ],
      ));
    });
  }
}
