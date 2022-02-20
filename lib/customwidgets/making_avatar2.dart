import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nazerin_project/constans/custom_colors.dart';

class MakingAvatar2 extends StatelessWidget {
  const MakingAvatar2(
      {Key? key,
      required this.avatarName,
      required this.avatarTitle,
      //this.ontap,
      this.child,
      this.avatarImage2})
      : super(key: key);

  final Key? avatarName;
  final String? avatarTitle;
  //final Function? ontap;
  final Widget? child;
  final AssetImage? avatarImage2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: child,
          key: avatarName,
          backgroundColor: replayOrange,
          backgroundImage: avatarImage2,
          maxRadius: 40,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          avatarTitle!,
          style: TextStyle(color: replayOrange, fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}
