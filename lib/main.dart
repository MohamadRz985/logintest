import 'package:flutter/material.dart';
import 'package:nazerin_project/login_page.dart';
import 'package:nazerin_project/ruler_map/bloc/bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ProviderMaps())],
        child:
            const MaterialApp(debugShowCheckedModeBanner: false, home: Login3()

                //Login3(),//FFirstPage(),
                ));
  }
}
