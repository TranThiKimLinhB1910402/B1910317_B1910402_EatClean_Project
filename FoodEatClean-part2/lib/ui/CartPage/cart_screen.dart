import 'package:eatcleanproject/ui/CartPage/app_bar_cart.dart';
import 'package:eatcleanproject/ui/CartPage/cart_item_card.dart';
import 'package:eatcleanproject/ui/colors.dart';
import 'package:eatcleanproject/ui/orders/order_manager.dart';
import 'package:eatcleanproject/ui/orders/order_screen.dart';
import 'package:eatcleanproject/ui/products/Manager/product_manager.dart';
import 'package:eatcleanproject/ui/screen.dart';
import 'package:eatcleanproject/ui/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartManager>();
    final total = cart.totalAmount;
    ChangeNotifierProvider(create: (context) => AuthManager());
    return Consumer<AuthManager>(
      builder: (context, authManager, child) {
        return Scaffold(
          body: Column(children: [
            AppBarCart(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(height: 1000, child: buildCartItems(cart)),
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 5.0,
                    spreadRadius: 5.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 5.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: buildCartSummary(cart, total),
            )
          ]),
        );
        //MaterialApp(debugShowCheckedModeBanner: false, home: CartPage()
        // authManager.isAuth
        //     ? CartPage()
        //     : FutureBuilder(
        //         future: authManager.tryAutoLogin(),
        //         builder: (context, snapshot) {
        //           return snapshot.connectionState == ConnectionState.waiting
        //               ? const SplashScreen()
        //               : AuthScreen();
        //         }),
      },
    );
  }

  Widget buildCartItems(CartManager cart) {
    return ListView(
        children: cart.productEntries
            .map(
              (entry) =>
                  CartItemCard(productId: entry.key, cartItem: entry.value),
            )
            .toList());
  }

  Widget buildCartSummary(CartManager cart, total) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 25, bottom: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      text: "Voucher",
                      size: 15,
                    ),
                    SmallText(
                      text: "Áp dụng mã giảm giá",
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Tổng cộng',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 135, 135, 135),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$total' + '00 VNĐ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              TextButton(
                child: Text(
                  'Đặt hàng',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: cart.totalAmount <= 0
                    ? null
                    : () {
                        context
                            .read<OrdersManager>()
                            .addOrder(cart.products, cart.totalAmount);
                        cart.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderScreen()));
                      },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 50, right: 50),
                    foregroundColor: Colors.white,
                    elevation: 20,
                    backgroundColor: AppColors.mainColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
