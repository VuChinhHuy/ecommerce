
import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/ui/favoritepage.dart';
import 'package:ecommerce/ui/homepage.dart';
import 'package:ecommerce/ui/profilepage.dart';
import 'package:ecommerce/ui/shoppage.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  List page = [const HomePage(), const ShopPage(), const FavoritePage(), const ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigatioBar(),
      floatingActionButton: _buildFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body:  page[_currentIndex],
    );
  }

  Widget _buildBottomNavigatioBar(){
    return
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BottomNavigationBar(
              unselectedItemColor: Colors.black38,
              selectedItemColor: const Color.fromRGBO(52, 40, 62, 1.0),
              backgroundColor: Colors.white,
              elevation: 0,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.storefront,), label: 'Shop'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
              ],
              unselectedIconTheme: const IconThemeData(),
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            width: 110.w,
          )
        ],
      );
  }

  Widget _buildFAB(){
    return Theme(data: Theme.of(context).copyWith(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        largeSizeConstraints: BoxConstraints.tightFor(width: 116.w,height: 56.w)
      )
    ), child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end:  Alignment.topRight,
              colors: [
                Color.fromRGBO(52, 40, 62, 1.0),
                Color.fromRGBO(132, 95, 161, 1.0),
              ]
          ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))
        ),
        child: FloatingActionButton.extended(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CartPage()));
        },
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
          icon: const Icon(Icons.shopping_cart),
          label: Column(
            children: const [
              Text('289'),
              Text('1 item'),
            ],
          )
        )
    )
    );

  }





}


