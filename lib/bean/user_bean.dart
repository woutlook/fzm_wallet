import 'dart:convert';

UserBean userBeanFromJson(String str) => UserBean.fromJson(json.decode(str));

String userBeanToJson(UserBean data) => json.encode(data.toJson());

class UserBean {
  UserBean({
    this.id,
    this.name,
    this.age,
  });

  UserBean.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }

  int? id;
  String? name;
  int? age;

  UserBean copyWith({
    int? id,
    String? name,
    int? age,
  }) =>
      UserBean(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['age'] = age;
    return map;
  }
}
