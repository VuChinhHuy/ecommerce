
import 'package:ecommerce/sql/favorite_responstory.dart';
import 'package:ecommerce/ui/homepage.dart';
import 'package:ecommerce/ui/product_details.dart';
import 'package:ecommerce/ui/shoppage.dart';
import 'package:ecommerce/ui/signuppage.dart';
import 'package:ecommerce/utils/rest_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RestClient().init('http://khoaluantotnghiep.tk/api');
    DataResponse().initDatabase();
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/homepage':(context) => HomePage(),
        '/shoppage':(context) => ShopPage(),
      },
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      // ),
      home: const SigupPage(),
    );
  }
}

