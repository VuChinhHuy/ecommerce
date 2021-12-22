import 'package:ecommerce/model/product.dart';

import 'customer.dart';

/// id : 0
/// url : "string"
/// product : {"id":0,"category":{"id":0,"parent":"string","name":"string","deleted":true,"icon":"string","display":true,"createdAt":"2021-12-22T03:02:02.536Z","updatedAt":"2021-12-22T03:02:02.537Z"},"seller":{"id":0,"firstName":"string","middleName":"string","lastName":"string","address":"string","phone":"string","dateOfBirth":"2021-12-22T03:02:02.537Z","gender":true,"deleted":true,"email":"string","joinDate":"2021-12-22T03:02:02.537Z","avatar":"string","createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"},"name":"string","price":0,"thumbnailUrl":"string","description":"string","stock":0,"purchases":0,"deleted":true,"createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"}
/// review : {"id":0,"product":{"id":0,"category":{"id":0,"parent":"string","name":"string","deleted":true,"icon":"string","display":true,"createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"},"seller":{"id":0,"firstName":"string","middleName":"string","lastName":"string","address":"string","phone":"string","dateOfBirth":"2021-12-22T03:02:02.537Z","gender":true,"deleted":true,"email":"string","joinDate":"2021-12-22T03:02:02.537Z","avatar":"string","createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"},"name":"string","price":0,"thumbnailUrl":"string","description":"string","stock":0,"purchases":0,"deleted":true,"createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"},"customer":{"id":0,"account":{"id":0,"username":"string","password":"string","active":true,"role":"string","salt":"string","createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"},"firstName":"string","middleName":"string","lastName":"string","address":"string","phone":"string","dateOfBirth":"2021-12-22T03:02:02.537Z","gender":true,"deleted":true,"email":"string","joinDate":"2021-12-22T03:02:02.537Z","avatar":"string","createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"},"content":"string","rating":0,"createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"}
/// createdAt : "2021-12-22T03:02:02.537Z"
/// updatedAt : "2021-12-22T03:02:02.537Z"

class Image {
  Image({
      int? id, 
      String? url, 
      Product? product, 
      Review? review, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _url = url;
    _product = product;
    _review = review;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Image.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
    _review = json['review'] != null ? Review.fromJson(json['review']) : null;
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  int? _id;
  String? _url;
  Product? _product;
  Review? _review;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get url => _url;
  Product? get product => _product;
  Review? get review => _review;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    if (_review != null) {
      map['review'] = _review?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}

/// id : 0
/// product : {"id":0,"category":{"id":0,"parent":"string","name":"string","deleted":true,"icon":"string","display":true,"createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"},"seller":{"id":0,"firstName":"string","middleName":"string","lastName":"string","address":"string","phone":"string","dateOfBirth":"2021-12-22T03:02:02.537Z","gender":true,"deleted":true,"email":"string","joinDate":"2021-12-22T03:02:02.537Z","avatar":"string","createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"},"name":"string","price":0,"thumbnailUrl":"string","description":"string","stock":0,"purchases":0,"deleted":true,"createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"}
/// customer : {"id":0,"account":{"id":0,"username":"string","password":"string","active":true,"role":"string","salt":"string","createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"},"firstName":"string","middleName":"string","lastName":"string","address":"string","phone":"string","dateOfBirth":"2021-12-22T03:02:02.537Z","gender":true,"deleted":true,"email":"string","joinDate":"2021-12-22T03:02:02.537Z","avatar":"string","createdAt":"2021-12-22T03:02:02.537Z","updatedAt":"2021-12-22T03:02:02.537Z"}
/// content : "string"
/// rating : 0
/// createdAt : "2021-12-22T03:02:02.537Z"
/// updatedAt : "2021-12-22T03:02:02.537Z"

class Review {
  Review({
      int? id, 
      Product? product, 
      Customer? customer, 
      String? content, 
      int? rating, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _product = product;
    _customer = customer;
    _content = content;
    _rating = rating;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Review.fromJson(dynamic json) {
    _id = json['id'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _content = json['content'];
    _rating = json['rating'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  int? _id;
  Product? _product;
  Customer? _customer;
  String? _content;
  int? _rating;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  Product? get product => _product;
  Customer? get customer => _customer;
  String? get content => _content;
  int? get rating => _rating;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    map['content'] = _content;
    map['rating'] = _rating;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}


