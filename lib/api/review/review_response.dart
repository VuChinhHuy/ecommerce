import 'dart:convert';

import 'package:ecommerce/model/review.dart';



class ReviewResponse{
   final List<Review> listReview;
   final String error;

   ReviewResponse(this.listReview,this.error);

   ReviewResponse.fromJson(String json) : listReview =
   (jsonDecode(json)['hydra:member'] as List).map((e) => Review.fromJson(e)).toList(),
   error ="";

   ReviewResponse.withError(String errorValue)
       : listReview = [],
         error = errorValue;

}