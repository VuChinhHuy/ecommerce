/// id : 0
/// parent : "string"
/// name : "string"
/// deleted : true
/// icon : "string"
/// display : true
/// createdAt : "2021-12-21T12:36:22.797Z"
/// updatedAt : "2021-12-21T12:36:22.797Z"

class Category {
  Category({
      int? id, 
      String? parent, 
      String? name, 
      bool? deleted, 
      String? icon, 
      bool? display, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _parent = parent;
    _name = name;
    _deleted = deleted;
    _icon = icon;
    _display = display;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _parent = json['parent'];
    _name = json['name'];
    _deleted = json['deleted'];
    _icon = json['icon'];
    _display = json['display'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  int? _id;
  String? _parent;
  String? _name;
  bool? _deleted;
  String? _icon;
  bool? _display;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get parent => _parent;
  String? get name => _name;
  bool? get deleted => _deleted;
  String? get icon => _icon;
  bool? get display => _display;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent'] = _parent;
    map['name'] = _name;
    map['deleted'] = _deleted;
    map['icon'] = _icon;
    map['display'] = _display;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}