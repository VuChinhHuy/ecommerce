import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/ui/cart.dart';
import 'package:ecommerce/wigdet/item_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _buildBottomBar(),
      body:
      SingleChildScrollView(
      child: Column(
        children: [
          Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
              width: double.infinity,
              height: 375.w),
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
                        rating: 4.0,
                        size: 12.w,
                        isReadOnly: true,
                        onRated: (rate) {

                        },
                        spacing: 10,),
                      SizedBox(width: 6.w,),
                      const Text('10 Review'),
                    ],
                  ),
                  SizedBox(height: 8.w),
                  Text('Saodimallsu Womens Turtleneck Oversized...',
                    style: GoogleFonts.nunito(fontSize: 19.t),maxLines: 2
                    ),
                  SizedBox(height: 12.w),
                  Text('100000 VND',style: GoogleFonts.sansita(fontSize: 25.t)),
                  SizedBox(height: 16.w),
                  Text('Image Review',style: GoogleFonts.nunito(fontSize: 14.t)),
                  SizedBox(height: 8.w),
                  Row(
                    children: [
                      Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                          width: 47.w,
                          height: 47.w),
                      SizedBox(width: 12.w),
                      Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                          width: 47.w,
                          height: 47.w),
                      SizedBox(width: 12.w),
                      Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                          width: 47.w,
                          height: 47.w),
                      SizedBox(width: 12.w),
                      Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                          width: 47.w,
                          height: 47.w),
                      SizedBox(width: 12.w),
                      Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                          width: 47.w,
                          height: 47.w),
                    ],
                  )


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
              padding: EdgeInsets.only(top: 24.w,left: 16.w,right: 16.w,bottom: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product details',
                      style: GoogleFonts.nunito(fontSize: 19.t,fontWeight: FontWeight.bold),maxLines: 2
                  ),
                  SizedBox(height: 8.w),
                  Text('Women\'s Casual V-Neck Pullover Sweater Long Sleeved Sweater Top with High Low Hemline is going to be the newest staple in your wardrobe! Living up to its namesake, this sweater is unbelievably soft, li...',
                      style: GoogleFonts.nunito(fontSize: 14.t),
                    maxLines: 5,
                  ),
                  SizedBox(height: 12.w),

                ],
              ),
            ),
          ),
          //Reivew
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
                  Text('Women\'s Casual V-Neck Pullover Sweater Long Sleeved Sweater Top with High Low Hemline is going to be the newest staple in your wardrobe! Living up to its namesake, this sweater is unbelievably soft, li...',
                      style: GoogleFonts.nunito(fontSize: 14.t)
                  ),
                  SizedBox(height: 12.w),
                Text('abc ',
                    style: GoogleFonts.nunito(fontSize: 16.t,fontWeight: FontWeight.bold),
                ),
                  Row(
                    children: [
                      Expanded(child:
                      SimpleStarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        rating: 4.0,
                        size: 12.w,
                        isReadOnly: true,
                        onRated: (rate) {

                        },
                        spacing: 10,)),
                      Text('25/12/2021'),
                    ],
                  ),
                  SizedBox(height: 16.w),
                  Text('I’m old (rolling through my 50’s). But, this is my daughter in law’s favorite color right now.❤️ So I wear it whenever we hang out! She’s my fashion consultant who keeps me on trend🤣',
                      style: GoogleFonts.nunito(fontSize: 14.t)
                  ),

                  CupertinoButton(onPressed: (){},
                    child: Text('More Comment'),
                  )

                ],
              ),
            ),
          ),
          SizedBox(height: 32.w),
          Text('Products related to this item',
              style: GoogleFonts.nunito(fontSize: 19.t,fontWeight: FontWeight.bold),maxLines: 2
          ),
          Container(
            height: 311.w,
            child:
          ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 331.w,
                width: 180.w,
                child: Center(
                  child: ProductCart(isFavorite: false,),
                )
              );
            },
          )
          ),
          SizedBox(height: 98.w)
        ],
      ),
    )
    );
  }
  _buildBottomBar(){
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CartPage()));

                    },
                    padding: EdgeInsets.all(12.w),
                    child: Text('ADD TO CART')
                )
            )),
            SizedBox(width: 16.w),
            Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
                elevation: 8.0,
                clipBehavior: Clip.antiAlias,
                child: MaterialButton(
                    splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                    height: 42.w,
                    minWidth: 42.w,
                    onPressed: (){
                      print('click abc');
                      // ),
                    },
                    padding: EdgeInsets.all(12.w),
                    child: Icon(
                      Icons.favorite_border,
                      color:  const Color.fromRGBO(52, 40, 62, 1.0),
                      size: 20.w,
                    )
                )
            )
          ],
        ),
      );
  }
}
