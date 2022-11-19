import 'package:eatcleanproject/ui/admin/product_list.dart';

import 'package:eatcleanproject/ui/screen.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthInfo extends StatefulWidget {
  const AuthInfo({super.key});

  @override
  State<AuthInfo> createState() => _AuthInfoState();
}

class _AuthInfoState extends State<AuthInfo> {
  @override
  Widget build(BuildContext context) {
    ChangeNotifierProvider(create: (context) => AuthManager());
    return Consumer<AuthManager>(
      builder: (context, authManager, child) {
        return Material(
          child: authManager.isAuth
              ? _buildLogout(authManager.authToken!.email)
              : FutureBuilder(
                  future: authManager.tryAutoLogin(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SplashScreen()
                        : AuthScreen();
                  }),
        );
      },
    );
  }

  Widget _buildLogout(auth) {
    return Consumer<AuthManager>(
      builder: (context, user, child) {
        return Material(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 30),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 20),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://images6.fanpop.com/image/photos/35200000/Dog-dogs-35247719-3706-2480.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  auth,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 370,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: auth == 'ngoctran080901@gmail.com' ||
                                auth == 'kimlinh@gmail.com'
                            ? Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: GFIconButton(
                                    onPressed: () {},
                                    icon:
                                        Icon(Icons.add_circle_outline_rounded),
                                    color: Colors.red,
                                    iconSize: 18,
                                    shape: GFIconButtonShape.circle,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductList()));
                                  },
                                  title: const Text('Quản lý sản phẩm'),
                                ),
                              )
                            : Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: GFIconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.shopping_bag),
                                    color: Colors.red,
                                    iconSize: 18,
                                    shape: GFIconButtonShape.circle,
                                  ),
                                  title: const Text('Đơn hàng của bạn'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderScreen()));
                                  },
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: auth == 'ngoctran080901@gmail.com' ||
                                auth == 'kimlinh@gmail.com'
                            ? Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: GFIconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.shopping_bag),
                                    color: Colors.green,
                                    iconSize: 18,
                                    shape: GFIconButtonShape.circle,
                                  ),
                                  title: const Text('Quản lý đơn hàng'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderScreen()));
                                  },
                                ),
                              )
                            : Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: GFIconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove_red_eye_sharp),
                                    color: Colors.green,
                                    iconSize: 18,
                                    shape: GFIconButtonShape.circle,
                                  ),
                                  title: const Text('Sản phẩm đã xem'),
                                  onTap: () {},
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            leading: GFIconButton(
                              onPressed: () {},
                              icon: Icon(Icons.question_answer),
                              color: Colors.purple,
                              iconSize: 18,
                              shape: GFIconButtonShape.circle,
                            ),
                            title: const Text('Trợ giúp'),
                            onTap: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            leading: GFIconButton(
                              onPressed: () {},
                              icon: Icon(Icons.settings),
                              color: Color.fromARGB(255, 253, 204, 5),
                              iconSize: 18,
                              shape: GFIconButtonShape.circle,
                            ),
                            title: const Text('Cài đặt tài khoản'),
                            onTap: () {},
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: ListTile(
                          leading: GFIconButton(
                            onPressed: () {},
                            icon: Icon(Icons.exit_to_app),
                            color: Color.fromARGB(255, 33, 51, 243),
                            iconSize: 18,
                            shape: GFIconButtonShape.circle,
                          ),
                          title: const Text('Log out'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()));

                            context.read<AuthManager>().logout();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
