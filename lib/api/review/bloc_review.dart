import 'package:ecommerce/api/review/review_response.dart';
import 'package:ecommerce/api/review/review_respository.dart';
import 'package:rxdart/rxdart.dart';

class ReviewBloc{
  final ReviewRepository _reviewRepository = ReviewRepository();
  final BehaviorSubject<ReviewResponse> _subject =
  BehaviorSubject<ReviewResponse>();

  getReviewProduct(String idProduct) async{
    ReviewResponse reivew = await _reviewRepository.getReviewProduct(idProduct);
    _subject.sink.add(reivew);
  }
  dispose() {
    _subject.close();
  }

  BehaviorSubject<ReviewResponse> get subject => _subject;

}
final blocReview = ReviewBloc();