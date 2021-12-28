
import 'package:ecommerce/api/category/category_repository.dart';
import 'package:ecommerce/api/category/category_response.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc{
  final CategoryRepository _categoryRepository = CategoryRepository();
  final BehaviorSubject<CategoryResponse> _subject =
  BehaviorSubject<CategoryResponse>();

  getCategory() async{
    CategoryResponse product = await _categoryRepository.getCategory();
    _subject.sink.add(product);
  }
  dispose() {
    _subject.close();
  }

  BehaviorSubject<CategoryResponse> get subject => _subject;

}
final blocCategory = CategoryBloc();