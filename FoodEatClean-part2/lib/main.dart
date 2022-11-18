import 'package:eatcleanproject/ui/orders/order_manager.dart';
import 'package:eatcleanproject/ui/orders/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'ui/screen.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductManager()),
        ChangeNotifierProvider(create: (context) => CartManager()),
        ChangeNotifierProvider(create: (context) => AuthManager()),
        ChangeNotifierProvider(create: (context) => OrdersManager()),
      ],
      child: Consumer<AuthManager>(builder: (context, authManager, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Eat Clean Hong',
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              textTheme: Theme.of(context)
                  .textTheme
                  .apply(displayColor: Colors.black)),
         
          home: authManager.isAuth
              ? const WelcomeScreen()
              : FutureBuilder(
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SplashScreen()
                        : const WelcomeScreen();
                  },
                ),
          onGenerateRoute: (index) {
            if (index.name == ProductDetailScreen.routeName) {
              final productId = index.arguments as String;
              return MaterialPageRoute(
                builder: (context) {
                  return ProductDetailScreen(
                      context.read<ProductManager>().findById(productId));
                },
              );
            }
            if (index.name == EditProductScreen.routeName) {
              final productId = index.arguments as String?;
              return MaterialPageRoute(builder: (ctx) {
                return EditProductScreen(
                  productId != null
                      ? ctx.read<ProductManager>().findById(productId)
                      : null,
                );
              });
            }
            return null;
          },
        );
      }),
    );
  }
}
