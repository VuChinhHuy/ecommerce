import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/wigdet/item_product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite',style: GoogleFonts.sansita(fontSize: 19.t)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
                begin: Alignment.bottomLeft,
                end:  Alignment.topRight,
                colors: [
                  Color.fromRGBO(52, 40, 62, 1.0),
                  Color.fromRGBO(132, 95, 161, 1.0),
                ]
            ),

          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              padding:  EdgeInsets.fromLTRB(16.w, 24.w, 16.w, 0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child:
                  Text('3 Items')
                  ),
                  Text('Sort by: '),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5.w, 47.w, 5.w, 0),
                child: _buildGirdView()),

          ],
        )
      )
    );
  }

  _buildGirdView()=>GridView.builder(
    itemCount: 3,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 4.0,
      mainAxisExtent: 311,
    ),
    itemBuilder: (BuildContext context, int index){
      return const Center(
        child: ProductCart(isFavorite: true,),
      );
    },
  );
}
