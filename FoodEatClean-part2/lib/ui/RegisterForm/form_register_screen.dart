import 'package:eatcleanproject/ui/RegisterForm/form_signin_screen.dart';
import 'package:flutter/material.dart';

import 'package:eatcleanproject/ui/colors.dart';
import '../RegisterForm/register_input.dart';
import '../widgets/appicon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/registerpage';
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Stack(children: [
                Positioned(
                    child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 280,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/Logo1.png'),
                    fit: BoxFit.contain,
                  )),
                )),
                Positioned(
                  top: 80,
                  left: 10,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: AppIcon(icon: Icons.arrow_back)),
                )
              ]),
              Container(
                height: 450,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ĐĂNG KÝ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.black38,
                            fontFamily: 'Poppins')),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(children: [
                        RegisterInput(
                            name: "Họ tên", icon: Icons.person, maxlength: 40),
                        RegisterInput(
                            name: "Địa chỉ", icon: Icons.house, maxlength: 100),
                        RegisterInput(
                            name: "Số điện thoại",
                            icon: Icons.phone,
                            maxlength: 10),
                        SizedBox(
                          height: 90,
                          child: TextFormField(
                            obscureText: passenable,
                            maxLength: 20,
                            decoration: InputDecoration(
                              hintText: 'Mật khẩu',
                              labelText: 'Mật khẩu',
                              suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (passenable) {
                                        passenable = false;
                                      } else {
                                        passenable = true;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                      passenable == true
                                          ? Icons.remove_red_eye
                                          : Icons.password,
                                      size: 15)),
                              prefixIcon: Icon(Icons.password),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              print('Đăng ký');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[600],
                                onPrimary: Colors.white),
                            child: Text(
                              'Đăng Ký',
                              style: TextStyle(fontSize: 17),
                            ))
                      ]),
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}

// ),
