import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/review.dart';
import 'package:ecommerce/wigdet/item_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewProduct extends StatefulWidget {
  const ReviewProduct({Key? key,required this.listReivew}) : super(key: key);
  final List<Review> listReivew;

  @override
  _ReviewProductState createState() => _ReviewProductState();
}

class _ReviewProductState extends State<ReviewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(16.w, 0.w, 16.w, 0),
        child: ListView.separated(
          itemCount: widget.listReivew.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemReview(item: widget.listReivew[index]);
          }, separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      )

    );
  }
}
