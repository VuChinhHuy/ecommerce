
import 'package:ecommerce/api/seller/seller_response.dart';
import 'package:ecommerce/api/seller/seller_respository.dart';
import 'package:rxdart/rxdart.dart';

class SellerBloc{
  final SellerRepository _sellerRepository = SellerRepository();
  final BehaviorSubject<SellerResponse> _subject =
  BehaviorSubject<SellerResponse>();

  getSeller() async{
    SellerResponse sellerResponse = await _sellerRepository.getSeller();
    _subject.sink.add(sellerResponse);
  }
  dispose() {
    _subject.close();
  }

  BehaviorSubject<SellerResponse> get subject => _subject;

}
final blocReview = SellerBloc();