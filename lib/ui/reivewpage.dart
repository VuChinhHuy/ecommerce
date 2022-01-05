import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/model/review.dart';
import 'package:ecommerce/wigdet/item_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class ReviewProduct extends StatefulWidget {
  const ReviewProduct({Key? key,required this.listReivew,required this.product}) : super(key: key);
  final List<Review> listReivew;
  final Product product;

  @override
  _ReviewProductState createState() => _ReviewProductState();
}

class _ReviewProductState extends State<ReviewProduct> {
  var f = NumberFormat('###.0#', 'en_US');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.w, 0.w, 16.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CloseButton(),
            Text('Rating&Reviews ',style: GoogleFonts.metrophobic(fontSize: 34.t,color: Colors.black,fontWeight: FontWeight.bold)),
            SizedBox(height: 16.w,),
            Text('${widget.product.name} ',style: GoogleFonts.metrophobic(fontSize: 19.t)),
            SizedBox(height: 16.w,),
            Container(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Column(
                      children: [
                        Text(f.format( averageRating(widget.listReivew)),style: GoogleFonts.metrophobic(fontSize: 44.t)),
                        Text('${sumRating(widget.listReivew)} ratings',style: GoogleFonts.metrophobic(fontSize: 19.t)),
                      ],

                    ),
                    SizedBox(width: 16.w,),
                    Expanded(child:
                    Column(
                      children: [
                        // 5 rating
                        Row(
                          children: [
                            SimpleStarRating(
                              allowHalfRating: true,
                              starCount: 5,
                              rating: 5,
                              size: 24.w,
                              isReadOnly: true,
                              onRated: (rate) {

                              },
                              spacing: 10,),
                            SizedBox(width: 16.w,),
                            Text('${fiveRating(widget.listReivew)}',style: GoogleFonts.metrophobic(fontSize: 19.t)),
                          ],
                        ),

                        SizedBox(height: 8.w,),
                        // 4 rating
                        Row(
                          children: [
                            SimpleStarRating(
                              allowHalfRating: true,
                              starCount: 5,
                              rating: 4,
                              size: 24.w,
                              isReadOnly: true,
                              onRated: (rate) {

                              },
                              spacing: 10,),
                            SizedBox(width: 16.w,),
                            Text('${fourRating(widget.listReivew)}',style: GoogleFonts.metrophobic(fontSize: 19.t)),
                          ],
                        ),
                        SizedBox(height: 8.w,),
                        // 3 rating
                        Row(
                          children: [
                            SimpleStarRating(
                              allowHalfRating: true,
                              starCount: 5,
                              rating: 3,
                              size: 24.w,
                              isReadOnly: true,
                              onRated: (rate) {

                              },
                              spacing: 10,),
                            SizedBox(width: 16.w,),
                            Text('${threeRating(widget.listReivew)}',style: GoogleFonts.metrophobic(fontSize: 19.t)),
                          ],
                        ),

                        SizedBox(height: 8.w,),
                        // 2 rating
                        Row(
                          children: [
                            SimpleStarRating(
                              allowHalfRating: true,
                              starCount: 5,
                              rating: 2,
                              size: 24.w,
                              isReadOnly: true,
                              onRated: (rate) {

                              },
                              spacing: 10,),
                            SizedBox(width: 16.w,),
                            Text('${twoRating(widget.listReivew)}',style: GoogleFonts.metrophobic(fontSize: 19.t)),
                          ],
                        ),

                        SizedBox(height: 8.w,),
                        // 1 rating
                        Row(
                          children: [
                            SimpleStarRating(
                              allowHalfRating: true,
                              starCount: 5,
                              rating: 1,
                              size: 24.w,
                              isReadOnly: true,
                              onRated: (rate) {

                              },
                              spacing: 10,),
                            SizedBox(width: 16.w,),
                            Text('${oneRating(widget.listReivew)}',style: GoogleFonts.metrophobic(fontSize: 19.t)),
                          ],
                        ),

                      ],
                    ),)
                  ],
                ),
              ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics:  const NeverScrollableScrollPhysics(),
              itemCount: widget.listReivew.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemReview(item: widget.listReivew[index]);
              },
            ),
          ],
        )
      )
      )
    );
  }
  sumRating(List<Review> listReview){
      int rating =0;
      listReview.forEach((element) {
        rating += element.rating!;
      });
      return rating;
  }
  averageRating(List<Review> listReview){
      double aver = 0;
      aver = sumRating(listReview)/listReview.length;
      return aver;
  }
  oneRating(List<Review> listReview){
    int five = 0;
    for (var element in listReview) {
      element.rating == 1? five ++ : five;
    }
    return five;
  }
  fiveRating(List<Review> listReview){
    int five = 0;
    for (var element in listReview) {
      element.rating == 5? five ++ : five;
    }
    return five;
  }
  fourRating(List<Review> listReview){
    int five = 0;
    for (var element in listReview) {
      element.rating == 4? five ++ : five;
    }
    return five;
  }
  threeRating(List<Review> listReview){
    int five = 0;
    for (var element in listReview) {
      element.rating == 3? five ++ : five;
    }
    return five;
  }
  twoRating(List<Review> listReview){
    int five = 0;
    for (var element in listReview) {
      element.rating == 2? five ++ : five;
    }
    return five;
  }
}
