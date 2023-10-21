// import 'dart:ffi';

import 'package:ecommerce/view/home/widget/app_bar.dart';
import 'package:ecommerce/view/home/widget/app_drawer.dart';
import 'package:ecommerce/view/home/widget/product_card.dart';
import 'package:ecommerce/viewmodels/products_viewmodels.dart';
import 'package:ecommerce/views/home/home.dart';
import 'package:ecommerce/views/home/widget/app_bar.dart';
import 'package:ecommerce/views/home/widget/app_drawer.dart';
import 'package:ecommerce/views/home/widget/product_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.shade100,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Poppins', bodyColor: Colors.black
        )
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.shade400,
        textTheme: Theme.of(context).textTheme.apply(
        fontFamily: 'Poppins',bodyColor: Colors.black
        )
      ),
      home: const MyHomePage(title: 'Shop Your Favorite'),
    );
  }
}







