import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nazerin_project/Services/userinfo.dart';
import 'package:nazerin_project/constans/custom_colors.dart';
import 'package:nazerin_project/customwidgets/buttn_widget.dart';
import 'package:nazerin_project/customwidgets/textfiled_widget.dart';
import 'package:nazerin_project/ffirst_page.dart';
import 'package:nazerin_project/signup_appbar.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart';

class Login3 extends StatefulWidget {
  const Login3({Key? key}) : super(key: key);

  @override
  _Login3State createState() => _Login3State();
}

//Strings for using user info ======================
String? username;
String? password;

// var email;
// var password;
final _formKey = GlobalKey<FormState>();

class _Login3State extends State<Login3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //AppBAr SET________________________
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'ورود ',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: mGray,
          ),
          backgroundColor: vlGray,
          body: Form(
              key: _formKey,
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    //Making TextFields_______________________
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFiledWidget(
                        obsecure: false,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "نام کاربری را وارد کنید";
                          } else if (!isAlpha(value)) {
                            return "ایمیل وارد کنید";
                          } else {
                            return null;
                          }
                        },
                        onsaved: (String? value) {
                          username = value;
                        },
                        lableText: "نام کاربری",
                        icon: Icons.person,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFiledWidget(
                        obsecure: true,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "کلمه عبور را وارد کنید";
                          } else if (value.length < 6) {
                            return "کلمه عبور صحیح را وارد کنید";
                          }
                        },
                        onsaved: (String? value) {
                          password = value;
                        },
                        lableText: 'کلمه عبور',
                        icon: Icons.lock_outline,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            print('object taped');
                          },
                          child: const Text(
                            "کلمه عبور را فراموش کردم",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    //! But And UserInfo========================⁡
                    GestureDetector(
                        onTap: () async {
                          //String? username = "Programmer";
                          //String? password = "Pr0gr@mMer";

                          //String? basicAuth = 'Basic' +
                          // base64Encode(utf8.encode("$username:$password"));
                          username = "Programmer";
                          password = "Pr0gr@mMer";
                          String url =
                              "http://46.209.155.42:9091/datasnap/rest/TServerMethods1/getdata/userdata/'Programmer'";
                          Uri? uri = Uri.tryParse(url);
                          Response response = await get(uri!);
                          // ,
                          //     headers: <String, String>{
                          //       'authorization': basicAuth
                          //     });
                          if (response.statusCode == 200) {
                            var result = json.decode(response.body);
                            var user = result["result"];

                            // UserInfo.fromJson(user[0][0]);
                            UserInfo userInfo = UserInfo.fromJson(user[0][0]);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const FFirstPage()));
                            // print("Display name is : ${userInfo.displayName}");
                            // print("sAMAcount is : ${userInfo.sAMAccountName}");
                            // print(
                            //     "PrincipalName is : ${userInfo.userPrincipalName}");
                            // print("LastLogon is : ${userInfo.lastLogon}");
                          }

                          // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();
                          // } else {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const FFirstPage()));
                          // //}
                        },
                        child: const ButtnWidget(
                          tittle: "ورود",
                          hasBorder: false,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpAppbar()));
                      },
                      child: const ButtnWidget(
                        tittle: "ثبت نام",
                        hasBorder: true,
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
