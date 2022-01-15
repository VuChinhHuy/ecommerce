
import 'dart:async';
import 'dart:ui';

import 'package:ecommerce/bloc/bloc_provider.dart';
import 'package:ecommerce/bloc/favorite_bloc.dart';
import 'package:ecommerce/bloc/favorite_product_bloc.dart';
import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/sql/favorite_enity.dart';
import 'package:ecommerce/ui/product_details.dart';
import 'package:ecommerce/utils/on_click.dart';
import 'package:ecommerce/utils/rest_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:intl/intl.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({Key? key,required this.product,required this.favoritesStream,required this.onPressed}) : super(key: key);
  final Product product;
  final VoidCallback onPressed;
  final Stream<List<Product>> favoritesStream;
  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  late FavoriteProductBloc _bloc;
  ///
  /// In order to determine whether this particular Product is
  /// part of the list of favorites, we need to inject the stream
  /// that gives us the list of all favorites to THIS instance
  /// of the BLoC
  ///
  late StreamSubscription _subscription;

  late bool _isFavorite = false;
  late Product product = Product();
  var f = NumberFormat('#,###', 'en_US');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
    _createBloc();
  }

  @override
  void didUpdateWidget(covariant ProductCart oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _disposeBloc();
    _createBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _disposeBloc();
  }

  void _createBloc(){
    _bloc = FavoriteProductBloc(product);

    // Simple pipe from the stream that lists all the favorites into
    // the BLoC that processes THIS particular product
    _subscription = widget.favoritesStream.listen(_bloc.inFavorites.add);
  }

  void _disposeBloc() {
    _subscription.cancel();
    _bloc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final FavoriteBloc bloc = BlocProvider.of<FavoriteBloc>(context);
    return InkWell(
        // onTap: () {
        //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProductDetail(productDetails: widget.product)));
        // },
      onTap: widget.onPressed,
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          borderOnForeground: false,
          child: Container(
              padding: EdgeInsets.all(5.w),
              child:Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network('http://khoaluan.tk/backend/assets/dist/images/products/${product.thumbnailUrl}',
                        width: 163.w,
                        height: 163.w,
                      ),
                      SizedBox(height: 8.w),
                      // Chinh sua ratring....
                      SimpleStarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        rating: (product.purchases! + 1.0),
                        size: 10.w,
                        isReadOnly: true,
                        onRated: (rate) {

                        },
                        spacing: 10,
                      ),
                      SizedBox(height: 8.w),
                      Text('${product.name}',
                        style: GoogleFonts.nunito(fontSize: 17.t),maxLines: 2
                        ,),
                      SizedBox(height: 8.w),
                      Text('${f.format(product.price)} VND',style: GoogleFonts.sansita(fontSize: 17.t),),

                    ],
                  ),
                  Positioned(
                      top: 140.w,
                      left: 110.w,
                      child: StreamBuilder<bool>(
                        stream: _bloc.outIsFavorite,
                        initialData: false,
                        builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
                          _isFavorite = snapshot.data!;
                          return Material(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                              elevation: 8.0,
                              clipBehavior: Clip.antiAlias,
                              child: MaterialButton(
                                  splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                                  height: 36.w,
                                  minWidth: 36.w,
                                  onPressed: (){
                                    _isFavorite? bloc.inRemoveFavorite.add(product) : bloc.inAddFavorite.add(product);

                                      _isFavorite = !_isFavorite;

                                    // onCLickFavorite(FavoriteSQL(product.id!, product.name!));

                                  },
                                  padding: EdgeInsets.all(12.w),
                                  child: _isFavorite? Icon(
                                    Icons.favorite,
                                    color:  Colors.red,
                                    size: 20.w,
                                  ):Icon(
                                    Icons.favorite_border,
                                    color:  const Color.fromRGBO(52, 40, 62, 1.0),
                                    size: 20.w,
                                  )
                              )
                          );
                        },
                      )

                  )],
              )) ,
        )

    );
  }
}

