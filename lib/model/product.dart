import 'package:ecommerce/model/seller.dart';

import 'category.dart';

/// id : 0
/// category : {"id":0,"parent":"string","name":"string","deleted":true,"icon":"string","display":true,"createdAt":"2021-12-21T12:40:31.576Z","updatedAt":"2021-12-21T12:40:31.576Z"}
/// seller : {"id":0,"firstName":"string","middleName":"string","lastName":"string","address":"string","phone":"string","dateOfBirth":"2021-12-21T12:40:31.576Z","gender":true,"deleted":true,"email":"string","joinDate":"2021-12-21T12:40:31.576Z","avatar":"string","createdAt":"2021-12-21T12:40:31.576Z","updatedAt":"2021-12-21T12:40:31.576Z"}
/// name : "string"
/// price : 0
/// thumbnailUrl : "string"
/// description : "string"
/// stock : 0
/// purchases : 0
/// deleted : true
/// createdAt : "2021-12-21T12:40:31.576Z"
/// updatedAt : "2021-12-21T12:40:31.576Z"

class Product {
  Product({
      int? id, 
      Category? category, 
      Seller? seller, 
      String? name, 
      int? price, 
      String? thumbnailUrl, 
      String? description, 
      int? stock, 
      int? purchases, 
      bool? deleted, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _category = category;
    _seller = seller;
    _name = name;
    _price = price;
    _thumbnailUrl = thumbnailUrl;
    _description = description;
    _stock = stock;
    _purchases = purchases;
    _deleted = deleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    _name = json['name'];
    _price = json['price'];
    _thumbnailUrl = json['thumbnailUrl'];
    _description = json['description'];
    _stock = json['stock'];
    _purchases = json['purchases'];
    _deleted = json['deleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  int? _id;
  Category? _category;
  Seller? _seller;
  String? _name;
  int? _price;
  String? _thumbnailUrl;
  String? _description;
  int? _stock;
  int? _purchases;
  bool? _deleted;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  Category? get category => _category;
  Seller? get seller => _seller;
  String? get name => _name;
  int? get price => _price;
  String? get thumbnailUrl => _thumbnailUrl;
  String? get description => _description;
  int? get stock => _stock;
  int? get purchases => _purchases;
  bool? get deleted => _deleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_seller != null) {
      map['seller'] = _seller?.toJson();
    }
    map['name'] = _name;
    map['price'] = _price;
    map['thumbnailUrl'] = _thumbnailUrl;
    map['description'] = _description;
    map['stock'] = _stock;
    map['purchases'] = _purchases;
    map['deleted'] = _deleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}




