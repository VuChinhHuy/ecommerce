import 'package:ecommerce/api/product/product_bloc.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/bloc/bloc_provider.dart';
import 'package:ecommerce/bloc/favorite_bloc.dart';
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
  List<Product> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavoriteData();
  }

  @override
  void dispose(){
    super.dispose();
    blocProduct.dispose();
  }
  getFavoriteData() async{
    // favoriteSql = await DataResponse.favoriteDao?.findAllFavorite() ?? [];
    // for (var element in favoriteSql)  {
    //   blocProduct.getProductId(element.id.toString());
    // }
    // setState(() {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    final FavoriteBloc bloc = BlocProvider.of<FavoriteBloc>(context);
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
              child: StreamBuilder<int>(
                initialData: 0,
                stream: bloc.outTotalFavorites,
                builder: (context, AsyncSnapshot<int> snap){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child:
                      Text('${snap.data} Items')
                      ),
                      Text('Sort by: '),

                    ],
                  );
                },
              )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5.w, 47.w, 5.w, 0),
                // child: StreamBuilder<Product>(
                //   // stream: blocProduct.product.stream,
                //   builder: (context,AsyncSnapshot<Product> snapshot){
                //     if(snapshot.hasData){
                //       if(favoriteSql.isNotEmpty){
                //         list.add(snapshot.data!);
                //         return  _buildGirdView(list);
                //       }
                //       return const Center(
                //         child: Text('NO ITEM IS FAVORITE'),
                //       );
                //     }
                //     else {
                //
                //       return buildLoadingWidget();
                //     }
                //   },
                // ),
              child: StreamBuilder(
                stream: bloc.outFavorites,
                builder: (context,AsyncSnapshot<List<Product>> snapshot){
                  if(snapshot.hasData){
                    print(snapshot.data);
                    if(snapshot.data!.isEmpty || snapshot.data!.length == 0) {
                      return const Center(
                        child: Text('NO ITEM IS FAVORITE'),
                      );
                    }
                     return _buildGirdView(snapshot.data!);
                  }
                  return buildLoadingWidget();
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
      final FavoriteBloc favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
      return ProductCart(product: productFavorite[index],favoritesStream: favoriteBloc.outFavorites,onPressed: (){});
    },
  );
}
