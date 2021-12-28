import 'package:ecommerce/api/review/review_api_provider.dart';
import 'package:ecommerce/api/review/review_response.dart';

class ReviewRepository{
  ReviewApiProvider _apiProvider = ReviewApiProvider();
  Future<ReviewResponse> getReviewProduct(String idProduct){
    return _apiProvider.getReview(idProduct);
  }
}