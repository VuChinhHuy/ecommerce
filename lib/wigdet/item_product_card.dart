import 'dart:ui';

import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/ui/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({Key? key,required this.isFavorite}) : super(key: key);
  final bool isFavorite;
  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  late bool _isFavorite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isFavorite = widget.isFavorite;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProductDetail()));
        },
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
                      Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                        width: 163.w,
                        height: 163.w,
                      ),
                      SizedBox(height: 8.w),
                      // Chinh sua ratring....
                      SimpleStarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        rating: 4.0,
                        size: 10.w,
                        isReadOnly: true,
                        onRated: (rate) {

                        },
                        spacing: 10,
                      ),
                      SizedBox(height: 8.w),
                      Text('Saodimallsu Womens Turtleneck Oversized...',
                        style: GoogleFonts.nunito(fontSize: 17.t),maxLines: 2
                        ,),
                      SizedBox(height: 8.w),
                      Text('100000 VND',style: GoogleFonts.sansita(fontSize: 17.t),),

                    ],
                  ),
                  Positioned(
                      top: 140.w,
                      left: 110.w,
                      child: Material(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                          elevation: 8.0,
                          clipBehavior: Clip.antiAlias,
                          child: MaterialButton(
                              splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                              height: 36.w,
                              minWidth: 36.w,
                              onPressed: (){
                                _isFavorite = !_isFavorite;
                                setState(() {

                                });
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
                      )),
                ],
              )) ,
        )

    );
  }
}

