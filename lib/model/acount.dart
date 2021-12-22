/// id : 0
/// username : "string"
/// password : "string"
/// active : true
/// role : "string"
/// salt : "string"
/// createdAt : "2021-12-21T12:28:41.933Z"
/// updatedAt : "2021-12-21T12:28:41.933Z"

class Account {
  Account({
      int? id, 
      String? username, 
      String? password, 
      bool? active, 
      String? role, 
      String? salt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _username = username;
    _password = password;
    _active = active;
    _role = role;
    _salt = salt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Account.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _password = json['password'];
    _active = json['active'];
    _role = json['role'];
    _salt = json['salt'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  int? _id;
  String? _username;
  String? _password;
  bool? _active;
  String? _role;
  String? _salt;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get username => _username;
  String? get password => _password;
  bool? get active => _active;
  String? get role => _role;
  String? get salt => _salt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['password'] = _password;
    map['active'] = _active;
    map['role'] = _role;
    map['salt'] = _salt;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}