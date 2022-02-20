import 'package:flutter/material.dart';
import 'package:nazerin_project/constans/custom_colors.dart';

class ButtnWidget extends StatelessWidget {
  const ButtnWidget({
    Key? key,
    required this.tittle,
    required this.hasBorder,
  }) : super(key: key);
  final String tittle;
  final bool hasBorder;
  // final Function ontapButtons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Container(
        height: 40,
        width: 270,
        decoration: BoxDecoration(
            color: hasBorder ? Colors.white : dGray,
            borderRadius: BorderRadius.circular(10),
            border: hasBorder
                ? Border.all(color: lGray)
                : const Border.fromBorderSide(BorderSide.none)),
        child: Center(
          child: Text(
            tittle,
            style: TextStyle(
                color: hasBorder ? dGray : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
