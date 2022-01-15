import 'package:ecommerce/sql/favorite_enity.dart';
import 'package:ecommerce/sql/favorite_responstory.dart';
import 'package:ecommerce/sql/product_enity.dart';

onCLickFavorite(FavoriteSQL favoriteSQL){
  DataResponse().checkFavorite(favoriteSQL).then((isFavorite){
    if(!isFavorite){
      // DataResponse.favoriteDao?.insertFavorite(favoriteSQL!);
      DataResponse.favoriteDao?.insertFavorite(favoriteSQL);
      print('add');
    }else{
      DataResponse.favoriteDao?.deleteFavorite(favoriteSQL);
      print('remove');
    }
  });
}
onClickAddToCard(ProductSQL productSQL)async{
  bool check = false;
  await DataResponse().checkProduct(productSQL).then((value) =>
    check = value
  );
  if(!check){
    DataResponse.productDao?.insertProduct(productSQL);
    print('add product');
  }else{
    ProductSQL productUpdate = ProductSQL(productSQL.id,productSQL.name,productSQL.quantity + 1);
    DataResponse.productDao?.updateProduct(productUpdate);
    print('add product +1');
  }
}


// click add favorite
handleAddFavorite(FavoriteSQL favoriteSQL) async {

}
