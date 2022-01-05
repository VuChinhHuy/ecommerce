import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class ItemReview extends StatelessWidget {
  const ItemReview({Key? key,required this.item}) : super(key: key);
  final Review item;

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 8.w,
       child: Padding(
         padding: EdgeInsets.all(5.w),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('${item.customer?.firstName} ${item.customer?.middleName} ${item.customer?.lastName}',
               style: GoogleFonts.nunito(fontSize: 16.t,fontWeight: FontWeight.bold),
             ),
             Row(
               children: [
                 Expanded(child:
                 SimpleStarRating(
                   allowHalfRating: true,
                   starCount: 5,
                   rating: item.rating!.toDouble(),
                   size: 12.w,
                   isReadOnly: true,
                   onRated: (rate) {

                   },
                   spacing: 10,)),
                 Text('${item.createdAt}',style: GoogleFonts.nunito(fontSize: 14.t),),
               ],
             ),
             SizedBox(height: 16.w),
             Text('${item.content}',
                 style: GoogleFonts.nunito(fontSize: 14.t)
             ),
           ],
         ),
       )
    );

  }
}
