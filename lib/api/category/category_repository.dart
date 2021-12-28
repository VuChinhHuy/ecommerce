import 'package:ecommerce/api/category/category_api_provider.dart';
import 'package:ecommerce/api/category/category_response.dart';

class CategoryRepository{
  CategoryApiProvider _categoryApiProvider = CategoryApiProvider();

  Future<CategoryResponse> getCategory(){
    return _categoryApiProvider.getCategroy();
  }
}