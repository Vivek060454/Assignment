import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: themeNotifier.isDark ? ThemeData().copyWith(
                scaffoldBackgroundColor: Colors.white,
                errorColor: Colors.red,
                colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.yellow,),
              ) : ThemeData.light(


              ),
              debugShowCheckedModeBanner: false,
              home: Home(),
            );
          }),
    );
  }
}
