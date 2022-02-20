import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nazerin_project/constans/custom_colors.dart';
import 'package:nazerin_project/customwidgets/buttn_widget.dart';
import 'package:nazerin_project/customwidgets/textfiled_widget.dart';
import 'package:validators/validators.dart';

class SignUpAppbar extends StatefulWidget {
  const SignUpAppbar({Key? key}) : super(key: key);

  @override
  _SignUpAppbarState createState() => _SignUpAppbarState();
}

final _formKey = GlobalKey<FormState>();
var authEmial;
var authName;
var authMobile;
var authUsername;
var authPassword;

class _SignUpAppbarState extends State<SignUpAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //AppBar Set________________________
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'ثبت نام ',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
          ),
          backgroundColor: mGray,
          toolbarHeight: 75,
        ),
        //Form Validators _ Box of All__________________________________
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: Container(
              //Getting Size of User Phone__________________________
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: vlGray,
              child: Column(
                //textfields each in Container__________________________
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFiledWidget(
                      lableText: 'نام ',
                      icon: Icons.person_add,
                      obsecure: false,
                      onsaved: (String? value) {
                        authName = value;
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "نام را وارد کنید";
                        } else if (!isAlpha(value)) {
                          return "حروف وارد کنید";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  //TextFields __________________________________________

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                    child: TextFiledWidget(
                      lableText: 'ایمیل ',
                      icon: Icons.mark_email_read_rounded,
                      obsecure: false,
                      onsaved: (String? value) {
                        authEmial = value;
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "ایمیل را وارد کنید";
                        } else if (!isEmail(value)) {
                          return "ایمیل وارد کنید";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                    child: TextFiledWidget(
                      lableText: 'موبایل ',
                      icon: Icons.mobile_friendly_sharp,
                      obsecure: false,
                      onsaved: (String? value) {
                        authMobile = value;
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "موبایل را وارد کنید";
                        } else if (!isInt(value)) {
                          return "شماره وارد کنید";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                    child: TextFiledWidget(
                      lableText: 'نام کاربری ',
                      icon: Icons.verified_user_outlined,
                      obsecure: false,
                      onsaved: (String? value) {
                        authUsername = value;
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "نام کاربری را وارد کنید";
                        } else if (!isInt(value)) {
                          return "نام وارد کنید";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                    child: TextFiledWidget(
                      onsaved: (String? value) {
                        authPassword = value;
                      },
                      lableText: "کلمه عبور ",
                      icon: Icons.lock_outline,
                      obsecure: true,
                      sufixIcon: Icons.visibility,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "کلمه عبور را وارد کنید";
                        } else if (value.length < 6) {
                          return "کلمه عبور صحیح را وارد کنید";
                        }
                      },
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 15, 12, 0),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }

                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const FFirstPage()));
                        },
                        child: const ButtnWidget(
                          tittle: "ثبت نام",
                          hasBorder: true,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
