
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/api/product/product_respository.dart';
import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/sql/favorite_responstory.dart';
import 'package:ecommerce/sql/product_enity.dart';
import 'package:ecommerce/ui/checkout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductSQL> productInCard = List.empty();
  ProductRepository productRepository = ProductRepository();
  var f = NumberFormat('#,###', 'en_US');
  List<Product> listProductCard = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void dispose(){
    super.dispose();
    productInCard.clear();
    listProductCard.clear();
  }
  getData() async {
    productInCard = await DataResponse.productDao?.findAllProduct() ?? [];
    for (var element in productInCard) {
      setState(() {
        var product = productRepository.getProductId(element.id.toString());
        product.then((value) => listProductCard.add(value));
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
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
        return Container(
          padding: EdgeInsets.all(5.w),
          child: Row(
            children: [
              Image.network('http://khoaluantotnghiep.tk/backend/assets/dist/images/products/${listProductCard[index].thumbnailUrl}',
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
                            DataResponse.productDao?.updateProduct(ProductSQL(productInCard[index].id, productInCard[index].name, productInCard[index].quantity - 1));
                            if(productInCard[index].quantity <= 0){
                              productInCard.remove(productInCard[index]);
                              listProductCard.remove(listProductCard[index]);
                              DataResponse.productDao?.deleteProduct(ProductSQL(productInCard[index].id, productInCard[index].name, productInCard[index].quantity));
                            }
                          });
                          // ),
                        },
                        padding: EdgeInsets.all(12.w),
                        child: Icon(
                          Icons.remove,
                          color:  const Color.fromRGBO(52, 40, 62, 1.0),
                          size: 12.w,
                        )
                    ),
                    SizedBox(width: 2.w,),
                    Text('${productInCard[index].quantity}',style: GoogleFonts.sansita(fontSize: 19.t)),
                    SizedBox(width: 2.w,),
                    MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                        splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                        height: 24.w,
                        minWidth: 24.w,
                        onPressed: (){
                          setState(() {
                            DataResponse.productDao?.updateProduct(ProductSQL(productInCard[index].id, productInCard[index].name, productInCard[index].quantity + 1));
                          });


                          // ),
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
                    setState(() {
                      productInCard.remove(productInCard[index]);
                      DataResponse.productDao?.deleteProduct(ProductSQL(productInCard[index].id, productInCard[index].name, productInCard[index].quantity));
                      listProductCard.remove(listProductCard[index]);
                    });
                    // ),
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
        color: Colors.black12,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child:
                Text('Total price',style: GoogleFonts.sansita(fontSize: 17.t),)),
                Text('${f.format(totalPrice())} VND',style: GoogleFonts.sansita(fontSize: 17.t),),
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
  totalPrice(){
    int price = 0;
    for(var e in productInCard){
        for(var product in listProductCard){
          if(e.id == product.id){
            price += e.quantity * product.price!;
          }
        }
    }
    return price;
  }

}
