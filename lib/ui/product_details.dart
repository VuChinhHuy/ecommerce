import 'package:ecommerce/api/product/product_bloc.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/api/review/bloc_review.dart';
import 'package:ecommerce/api/review/review_response.dart';
import 'package:ecommerce/bloc/bloc_provider.dart';
import 'package:ecommerce/bloc/cart_bloc.dart';
import 'package:ecommerce/bloc/favorite_bloc.dart';
import 'package:ecommerce/bloc/favorite_product_bloc.dart';
import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/model/review.dart';
import 'package:ecommerce/ui/ar_view_page.dart';
import 'package:ecommerce/ui/cart.dart';
import 'package:ecommerce/ui/reivewpage.dart';
import 'package:ecommerce/wigdet/build_load.dart';
import 'package:ecommerce/wigdet/item_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key,required this.productDetails}) : super(key: key);
  final Product productDetails;
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Product product = Product();
  bool expendDetails = false;
  late bool isFavorite = false;
  List<Review> review = [];
  var f = NumberFormat('#,###', 'en_US');
  List<Product> productRelated = List.empty();

  @override
  initState(){
    super.initState();
    product = widget.productDetails;
    if(!blocReview.subject.isClosed){
      blocReview.getReviewProduct(product.id.toString());
    }
  }
  @override
  void dispose(){
    super.dispose();
    if(blocReview.subject.isClosed){
      blocReview.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final FavoriteBloc bloc = BlocProvider.of<FavoriteBloc>(context);
    final FavoriteProductBloc blocFavorite = FavoriteProductBloc(widget.productDetails);
    final CartBloc blocCart = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      bottomSheet: _buildBottomBar(bloc,blocFavorite,blocCart),
      body:
      SingleChildScrollView(
      child: Column(
        children: [
          Stack(
          children: [
            Image.network('http://khoaluan.tk/backend/assets/dist/images/products/${product.thumbnailUrl}',
                width: double.infinity,
                height: 375.w),
            Positioned(
                right: 16.w,
                bottom: 16.w,
                child: IconButton(icon: Icon(Icons.view_in_ar,color: Colors.black,size: 32.w,),
                  onPressed: () { showDialog(context: context, builder: (BuildContext context){
                    return ARView();
                  }); },)),
          ],
          ),

          // Information
          Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SimpleStarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        rating: product.purchases! +1,
                        size: 12.w,
                        isReadOnly: true,
                        onRated: (rate) {

                        },
                        spacing: 10,),
                      SizedBox(width: 6.w,),
                      Text('${review.length} Review'),
                    ],
                  ),
                  SizedBox(height: 8.w),
                  Text('${product.name}.',
                    style: GoogleFonts.nunito(fontSize: 19.t),maxLines: 2
                    ),
                  SizedBox(height: 12.w),
                  Text('${f.format(product.price)} VND',style: GoogleFonts.sansita(fontSize: 25.t)),
                  SizedBox(height: 16.w),
                  // Text('Image Review',style: GoogleFonts.nunito(fontSize: 14.t)),
                  // SizedBox(height: 8.w),
                  // Row(
                  //   children: [
                  //     Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                  //         width: 47.w,
                  //         height: 47.w),
                  //     SizedBox(width: 12.w),
                  //     Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                  //         width: 47.w,
                  //         height: 47.w),
                  //     SizedBox(width: 12.w),
                  //     Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                  //         width: 47.w,
                  //         height: 47.w),
                  //     SizedBox(width: 12.w),
                  //     Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                  //         width: 47.w,
                  //         height: 47.w),
                  //     SizedBox(width: 12.w),
                  //     Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                  //         width: 47.w,
                  //         height: 47.w),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
          //Product detail
          Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 24.w,left: 16.w,right: 16.w,bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product details',
                      style: GoogleFonts.nunito(fontSize: 19.t,fontWeight: FontWeight.bold),maxLines: 2
                  ),
                  SizedBox(height: 8.w),
                  Text('${product.description}',
                      style: GoogleFonts.nunito(fontSize: 14.t),
                    maxLines: expendDetails ? null : 5 ,
                  ),
                  Container(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          expendDetails = !expendDetails;
                        });
                      },
                      child: Icon(expendDetails ? Icons.expand_less : Icons.expand_more,size: 24),
                    )
                  )
                ],
              ),
            ),
          ),
          StreamBuilder<ReviewResponse>(
            stream: blocReview.subject.stream,
              builder: (context,AsyncSnapshot<ReviewResponse> snap){
                if(snap.hasData){
                  review = snap.data!.listReview;
                  if(review.isNotEmpty) {
                    return Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child:
                              Text('Reviews',
                                  style: GoogleFonts.nunito(fontSize: 19.t,fontWeight: FontWeight.bold),maxLines: 2
                              )),
                              CupertinoButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ReviewProduct(listReivew: review,product: product)));
                              },
                                child: Row(
                                  children: const[
                                    Text('See all'),
                                    Icon(Icons.chevron_right),
                                  ],
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: 8.w),
                          Text('Women\'s Casual V-Neck Pullover Sweater Long Sleeved Sweater Top with High Low Hemline is going to be the newest staple in your wardrobe! Living up to its namesake, this sweater is unbelievably soft, li...',
                              style: GoogleFonts.nunito(fontSize: 14.t)
                          ),
                          SizedBox(height: 12.w),
                          Text('${review.first.customer?.lastName}',
                            style: GoogleFonts.nunito(fontSize: 16.t,fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Expanded(child:
                              SimpleStarRating(
                                allowHalfRating: true,
                                starCount: 5,
                                rating: review.first.rating!.toDouble(),
                                size: 12.w,
                                isReadOnly: true,
                                onRated: (rate) {

                                },
                                spacing: 10,)),
                              Text('${review.first.createdAt}'),
                            ],
                          ),
                          SizedBox(height: 16.w),
                          Text('${review.first.content}',
                              style: GoogleFonts.nunito(fontSize: 14.t)
                          ),

                        ],
                      ),
                    ),
                  );
                  }
                  return Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child:
                              Text('Reviews',
                                  style: GoogleFonts.nunito(fontSize: 19.t,fontWeight: FontWeight.bold),maxLines: 2
                              )),
                              CupertinoButton(onPressed: (){},
                                child: Row(
                                  children: const[
                                    Text('See all'),
                                    Icon(Icons.chevron_right),
                                  ],
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: 8.w),
                          Text('No reviews',
                              style: GoogleFonts.nunito(fontSize: 14.t)
                          ),
                        ],
                      ),
                    ),
                  );
                }else
                  return buildLoadingWidget();
              }),
          //Reivew

          SizedBox(height: 32.w),
          Text('Products related to this item',
              style: GoogleFonts.nunito(fontSize: 19.t,fontWeight: FontWeight.bold),maxLines: 2
          ),
          Container(
            height: 311.w,
            child: StreamBuilder<ProductResponse>(
              stream: blocProduct.subject.stream,
              builder: (context,AsyncSnapshot<ProductResponse> snapshot){
                if(snapshot.hasData){
                  List<Product> listProduct = snapshot.data!.list;
                  productRelated = listProduct.where((element) => element.category?.name == product.category?.name).toList();
                  productRelated.removeWhere((element) => element.id == product.id);
                  productRelated.take(5);
                  return  ListView.builder(
                      itemCount: productRelated.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final FavoriteBloc favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
                        return SizedBox(
                          height: 331.w,
                          width: 180.w,
                          child: Center(
                            child: ProductCart(product: productRelated[index],onPressed: (){},favoritesStream: favoriteBloc.outFavorites,)
                          )
                        );
                      },
                  );
                }
                else {
                  return buildLoadingWidget();
                }
              },
            )

          ),
          SizedBox(height: 98.w)
        ],
      ),
    )
    );
  }
  _buildBottomBar(FavoriteBloc bloc,FavoriteProductBloc blocCheckFavorite, CartBloc blocCart){
      return Container(
        height: 98.w,
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25.w),topRight: Radius.circular(25.w))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
                elevation: 8.0,
                clipBehavior: Clip.antiAlias,
                child: MaterialButton(
                    splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                    height: 42.w,
                    minWidth: 42.w,
                    onPressed: (){
                      Navigator.of(context).pop(false);
                    },
                    padding: EdgeInsets.all(12.w),
                    child: Icon(
                      Icons.arrow_back,
                      color:  const Color.fromRGBO(52, 40, 62, 1.0),
                      size: 20.w,
                    )
                )
            ),
            SizedBox(width: 16.w),
            Expanded(child:
            Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
                elevation: 8.0,
                clipBehavior: Clip.antiAlias,
                color: Colors.amber,
                child: MaterialButton(
                    splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                    height: 42.w,
                    minWidth: 42.w,
                    onPressed: (){
                      blocCart.inAddCart.add(product);
                      //
                      // onClickAddToCard(ProductSQL(product.id!, product.name!, 1));

                      showDialog(context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Add To Card is Success"),
                          contentPadding: EdgeInsets.all(8.w),
                          content: Icon(Icons.check_circle,size: 32.w),
                          actions: [
                            MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                            },
                              color: Colors.black38,
                              child: Text('Keep Buying'),
                            ),
                            MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
                                     return CartPage();
                                  } ));
                                },
                            color: Colors.orange,
                            child: Text('Go to Card'),),
                          ],
                        );

                      });
                    },
                    padding: EdgeInsets.all(12.w),
                    child: Text('ADD TO CART')
                )
            )),
            SizedBox(width: 16.w),
            StreamBuilder<bool>(
              initialData: false,
              stream: blocCheckFavorite.outIsFavorite,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
                isFavorite = snapshot.data!;
                return  Material(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
                    elevation: 8.0,
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                        splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                        height: 42.w,
                        minWidth: 42.w,
                        onPressed: (){
                          isFavorite? bloc.inRemoveFavorite.add(widget.productDetails) : bloc.inAddFavorite.add(widget.productDetails);
                          isFavorite = !isFavorite;
                          // setState(() {
                          //   // onCLickFavorite(FavoriteSQL(product.id!, product.name!));
                          // });
                          // ),
                        },
                        padding: EdgeInsets.all(12.w),
                        child: Icon( isFavorite ? Icons.favorite:
                        Icons.favorite_border,
                          color:  isFavorite? Colors.red : const Color.fromRGBO(52, 40, 62, 1.0),
                          size: 20.w,
                        )
                    )
                );
              },
            ),

          ],
        ),
      );
  }
}
