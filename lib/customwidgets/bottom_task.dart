import 'package:flutter/material.dart';

class BottomTask extends StatelessWidget {
  const BottomTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Scaffold(
      bottomSheet: SafeArea(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: Text('bottom sheet ',
                style: TextStyle(
                  fontSize: 50,
                )),
          ),
          color: Colors.red,
        ),
      ),
    ));
  }
}
