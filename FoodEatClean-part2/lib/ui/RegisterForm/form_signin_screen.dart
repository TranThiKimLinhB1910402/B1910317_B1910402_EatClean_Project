import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:eatcleanproject/ui/colors.dart';
import 'form_register_screen.dart';
import '../RegisterForm/register_input.dart';
import '../appicon.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/signinpage';
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Logo1.png'))),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(children: [
                    RegisterInput(
                      name: 'Số điện thoại',
                      icon: Icons.phone,
                      maxlength: 10,
                    ),
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
                              icon: FaIcon(
                                passenable == true
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15,
                              )),
                          prefixIcon: Icon(
                            Icons.password,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: () {
                            print('Đăng Nhập');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.mainColor,
                              onPrimary: Colors.white),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                
                                ),
                            child: Text(
                              'Đăng Nhập',
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                    )
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Column(children: [
                    RichText(
                        text: TextSpan(
                            text: 'Không có tài khoản? Tạo tài khoản',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed(RegisterPage.routeName);
                              },
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.grey))),
                    Row(
                      children: [],
                    )
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
