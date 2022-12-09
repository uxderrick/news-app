import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'home.dart';

class MyColors {
  static const Color primaryWhite = Color(0xffffffff);
  static const Color primaryBlue = Color(0xff5474FD);
  static const Color primaryBlack = Color(0xff19202D);
  static const Color primaryGrey = Color(0xff9397A0);
  static const Color bgBlue = Color(0xffEFF5F4);
  static const Color bgWhite = Color(0xfffcfcfc);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'DM Sans'),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
//TODO: Liquid pull to refresh