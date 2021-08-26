import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist_app_provider/provider/product_notifier.dart';
import 'package:shoppinglist_app_provider/screens/home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ProductNotifier(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.indigoAccent),
        primaryColor: Colors.indigoAccent,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
