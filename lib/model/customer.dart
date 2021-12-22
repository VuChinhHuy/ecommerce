import 'acount.dart';

/// id : 0
/// account : {"id":0,"username":"string","password":"string","active":true,"role":"string","salt":"string","createdAt":"2021-12-21T12:37:30.576Z","updatedAt":"2021-12-21T12:37:30.576Z"}
/// firstName : "string"
/// middleName : "string"
/// lastName : "string"
/// address : "string"
/// phone : "string"
/// dateOfBirth : "2021-12-21T12:37:30.576Z"
/// gender : true
/// deleted : true
/// email : "string"
/// joinDate : "2021-12-21T12:37:30.576Z"
/// avatar : "string"
/// createdAt : "2021-12-21T12:37:30.576Z"
/// updatedAt : "2021-12-21T12:37:30.576Z"

class Customer {
  Customer({
      int? id, 
      Account? account, 
      String? firstName, 
      String? middleName, 
      String? lastName, 
      String? address, 
      String? phone, 
      String? dateOfBirth, 
      bool? gender, 
      bool? deleted, 
      String? email, 
      String? joinDate, 
      String? avatar, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _account = account;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _address = address;
    _phone = phone;
    _dateOfBirth = dateOfBirth;
    _gender = gender;
    _deleted = deleted;
    _email = email;
    _joinDate = joinDate;
    _avatar = avatar;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _account = json['account'] != null ? Account.fromJson(json['account']) : null;
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _address = json['address'];
    _phone = json['phone'];
    _dateOfBirth = json['dateOfBirth'];
    _gender = json['gender'];
    _deleted = json['deleted'];
    _email = json['email'];
    _joinDate = json['joinDate'];
    _avatar = json['avatar'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  int? _id;
  Account? _account;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _address;
  String? _phone;
  String? _dateOfBirth;
  bool? _gender;
  bool? _deleted;
  String? _email;
  String? _joinDate;
  String? _avatar;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  Account? get account => _account;
  String? get firstName => _firstName;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  String? get address => _address;
  String? get phone => _phone;
  String? get dateOfBirth => _dateOfBirth;
  bool? get gender => _gender;
  bool? get deleted => _deleted;
  String? get email => _email;
  String? get joinDate => _joinDate;
  String? get avatar => _avatar;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_account != null) {
      map['account'] = _account?.toJson();
    }
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['address'] = _address;
    map['phone'] = _phone;
    map['dateOfBirth'] = _dateOfBirth;
    map['gender'] = _gender;
    map['deleted'] = _deleted;
    map['email'] = _email;
    map['joinDate'] = _joinDate;
    map['avatar'] = _avatar;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}

