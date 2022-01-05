import 'package:ecommerce/model/seller.dart';
import 'package:ecommerce/wigdet/appbar.dart';
import 'package:ecommerce/wigdet/item_shop_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ShopCard(shop: new Seller()),
    );
  }
}
