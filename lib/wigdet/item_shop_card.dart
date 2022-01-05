import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopCard extends StatelessWidget {
  final Seller shop;
  const ShopCard({Key? key,required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProductDetail(productDetails: product)));
        },
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          borderOnForeground: false,
          child: Container(
            width: double.infinity,
              height: 120.w,
              padding: EdgeInsets.all(5.w),
              child: Row(
                children: [
                  Image.network('http://khoaluantotnghiep.tk/backend/assets/dist/images/avatars/clothing.png',
                  width: 100,
                  height: 100,),
                  SizedBox(width: 8.w,),
                  Expanded(child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("SHop",style: GoogleFonts.metrophobic(fontWeight: FontWeight.bold,fontSize: 28.t),),
                        SizedBox(height: 8.w,),
                        Text("${shop.phone}",style: GoogleFonts.metrophobic(fontSize: 19.t),),
                        SizedBox(height: 8.w,),
                        Text("${shop.address}",style: GoogleFonts.metrophobic(fontSize: 19.t),),

                      ],
                    )
                  )
                ],
              )
          ) ,
        )

    );
  }
}
