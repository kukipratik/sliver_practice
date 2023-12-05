import 'package:flutter/material.dart';
import 'package:sliver_practice/search_page.dart';
// import 'package:sliver_practice/app_bar.dart';
// import 'package:sliver_practice/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silver App Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const SliverSearchPage(),
      home: const SliverSearchPage(),
    );
  }
}
