import 'package:ecommerce/api/product/product_bloc.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/sql/favorite_enity.dart';
import 'package:ecommerce/sql/favorite_responstory.dart';
import 'package:ecommerce/wigdet/build_load.dart';
import 'package:ecommerce/wigdet/item_product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<FavoriteSQL> favoriteSql = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavoriteData();
  }
  getFavoriteData() async{
    favoriteSql = await DataResponse.favoriteDao?.findAllFavorite() ?? [];
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
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
                  Text('${favoriteSql.length} Items')
                  ),
                  Text('Sort by: '),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5.w, 47.w, 5.w, 0),
                child: StreamBuilder<ProductResponse>(
                  stream: blocProduct.subject.stream,
                  builder: (context,AsyncSnapshot<ProductResponse> snapshot){
                    if(snapshot.hasData){
                      List<Product> listProduct = snapshot.data!.list;
                      List<Product> listFavorite =[];
                      if(favoriteSql.isNotEmpty){
                        for (var e in favoriteSql) {
                          listFavorite.addAll(listProduct.where((element) => element.id == e.id));
                        }
                        return  _buildGirdView(listFavorite);
                      }
                      return Center(
                        child: Text('NO ITEM IS FAVORITE'),
                      );
                    }
                    else return buildLoadingWidget();
                  },
                ),
            )
          ],
        )
      )
    );
  }

  _buildGirdView(List<Product> productFavorite)=>GridView.builder(
    itemCount: productFavorite.length,
    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5.w,
      mainAxisSpacing: 4.0.w,
      mainAxisExtent: 311.w,
    ),
    itemBuilder: (BuildContext context, int index){
      return ProductCart(product: productFavorite[index],isFavorite: true,);
    },
  );
}
