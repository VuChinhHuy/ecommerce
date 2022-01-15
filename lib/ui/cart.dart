

import 'package:ecommerce/bloc/bloc_provider.dart';
import 'package:ecommerce/bloc/cart_bloc.dart';
import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/ui/checkout.dart';
import 'package:ecommerce/wigdet/build_load.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var f = NumberFormat('#,###', 'en_US');
  List<Product> listProductCard = [];
  List<int> quantity = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose(){
    super.dispose();
    // quantity.clear();
  }
  // getData() async {
  //   productInCard = await DataResponse.productDao?.findAllProduct() ?? [];
  //   for (var element in productInCard) {
  //     blocProduct.getProductId(element.id.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: StreamBuilder(
        stream: bloc.outCart,
        builder: (context,AsyncSnapshot<List<Product>> snapshot){
          if(snapshot.hasData){
             listProductCard = snapshot.data!;
             for(int i = 0; i < snapshot.data!.length;i++ ){
                 quantity.add(1);
             }
            if(listProductCard.isNotEmpty) {
              return _buildBody();
            }
            return const Center(
              child: Text('NO ITEM IN CART'),
            );
          }
          else {

            return buildLoadingWidget();
          }
        },
      ),
      bottomSheet: _buildBottomSheet(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: Text('Cart',style: GoogleFonts.sansita(fontSize: 19.t)),
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
    );

  }


  _buildBody()=>ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final CartBloc blocCart = BlocProvider.of<CartBloc>(context);
        return Container(
          padding: EdgeInsets.all(5.w),
          child: Row(
            children: [
              Image.network('http://khoaluan.tk/backend/assets/dist/images/products/${listProductCard[index].thumbnailUrl}',
                width: 80.w,
                height: 80.w,
              ),
              SizedBox(width: 16.w,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${listProductCard[index].name}',style: GoogleFonts.sansita(fontSize: 14.t),maxLines: 3,),
                  SizedBox(height: 8.w,),
                  Row(children: [
                    Expanded(child:
                    Text('${f.format(listProductCard[index].price)} VND',style: GoogleFonts.sansita(fontSize: 19.t))),
                    MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                        splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                        height: 24.w,
                        minWidth: 24.w,
                        onPressed: (){
                          setState(() {
                            if(quantity[index] > 1) {
                              quantity[index] = quantity[index] -1;
                            }
                          });
                        },
                        padding: EdgeInsets.all(12.w),
                        child: Icon(
                          Icons.remove,
                          color:  const Color.fromRGBO(52, 40, 62, 1.0),
                          size: 12.w,
                        )
                    ),
                    SizedBox(width: 2.w,),
                    Text('${quantity[index]}',style: GoogleFonts.sansita(fontSize: 19.t)),
                    SizedBox(width: 2.w,),
                    MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                        splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                        height: 24.w,
                        minWidth: 24.w,
                        onPressed: (){
                          setState(() {
                            quantity[index] = quantity[index] +1;
                            print(quantity);
                            print(listProductCard);
                          });
                        },
                        padding: EdgeInsets.all(12.w),
                        child: Icon(
                          Icons.add,
                          color:  const Color.fromRGBO(52, 40, 62, 1.0),
                          size: 12.w,
                        )
                    ),
                  ],),

                ],
              )),
              MaterialButton(
                  splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                  height: 24.w,
                  minWidth: 24.w,
                  onPressed: (){
                    blocCart.inRemoveCart.add(listProductCard[index]);
                    setState(() {
                    });
                  },
                  padding: EdgeInsets.all(12.w),
                  child: Icon(
                    Icons.close,
                    color:  const Color.fromRGBO(52, 40, 62, 1.0),
                    size: 20.w,
                  )
              ),
            ],
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: listProductCard.length);


  _buildBottomSheet(){
    return
      Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
      elevation: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: EdgeInsets.all(16.w),
        height: 139.w,
        width: double.infinity,
        color: Colors.black12,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child:
                Text('Total price',style: GoogleFonts.sansita(fontSize: 17.t),)),
                FutureBuilder<int>(
                  future: total(),
                    builder: (context,AsyncSnapshot<int> snap){
                    if(snap.hasData) {
                      return Text('${f.format(snap.data)} VND',style: GoogleFonts.sansita(fontSize: 17.t),);
                    }
                    return Text('${f.format(0)} VND',style: GoogleFonts.sansita(fontSize: 17.t),);;
                }),
              ],
            ),
            SizedBox(height: 16.w),
            Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
                elevation: 8.0,
                clipBehavior: Clip.antiAlias,
                color: Colors.amber,
                child: MaterialButton(
                    splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                    height: 42.w,
                    minWidth: 343.w,
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CheckOutPage()));
                    },
                    child:  Text('Check out',style: GoogleFonts.nunito(fontSize: 17.t),),

                )
            ),
          ],
        ),
      ),
    );
  }
  Future<int> total() async{
   int price = 0;
   for(int i = 0; i < listProductCard.length; i++){
        price += (quantity[i] * listProductCard[i].price!);
   }
   return Future.value(price);
  }

}
