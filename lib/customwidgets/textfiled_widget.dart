import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nazerin_project/constans/custom_colors.dart';

class TextFiledWidget extends StatelessWidget {
  final String? lableText;
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  final bool obsecure;
  // ignore: prefer_typing_uninitialized_variables
  final sufixIcon;
  final String? Function(String?) validate;
  final String? Function(String?) onsaved;
  const TextFiledWidget(
      {Key? key,
      this.lableText,
      this.icon,
      required this.obsecure,
      this.sufixIcon,
      required this.validate,
      required this.onsaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
            height: 80,
            child: TextFormField(
                obscureText: obsecure,
                validator: validate,
                onSaved: onsaved,
                style: TextStyle(
                  color: replayOrange,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                    fillColor: mGray,
                    labelText: lableText,
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    //BoarderSide On Focus
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        )),
                    prefixIcon: Icon(
                      icon,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      sufixIcon,
                      color: dGray,
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        )),
                    errorStyle:
                        TextStyle(color: Colors.orange[300], fontSize: 12),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ))

                    //  OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(15))

                    // OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(15),
                    //     borderSide: const BorderSide(
                    //       color: Colors.white,
                    //     )),
                    ))));
  }
}
