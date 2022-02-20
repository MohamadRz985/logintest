import 'package:flutter/material.dart';
import 'package:nazerin_project/ruler_map/bloc/bloc.dart';

import 'package:provider/provider.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    final dialg = Provider.of<ProviderMaps>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.5),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width / 1.2,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    dialg.imageby == null
                        ? const Center(child: CircularProgressIndicator())
                        : Container(
                            padding: const EdgeInsets.all(30),
                            height: 230,
                            //width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black26, width: 0.5),
                                image: DecorationImage(
                                    image: MemoryImage(dialg.imageby!),
                                    fit: BoxFit.cover)),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(' مساحت :',
                            style: TextStyle(fontSize: 16, color: dialg.color)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(dialg.area!,
                            style: const TextStyle(color: Colors.black54)),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(' آدرس تقریبی :',
                            style: TextStyle(fontSize: 16, color: dialg.color)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(dialg.direction!,
                            style: const TextStyle(color: Colors.black54)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                          elevation: 0,
                          color: Colors.blueAccent,
                          onPressed: () {
                            dialg.changectdialog(false);
                          },
                          child: const Text('خروج')),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
