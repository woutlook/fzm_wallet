// import 'dart:convert';

// ExItem exBeanFromJson(String str) => ExItem.fromJson(json.decode(str));

// String exBeanToJson(ExItem data) => json.encode(data.toJson());

class ExItem {
  ExItem({
    this.id,
    this.name,
    this.style,
    this.status,
    this.apps,
  });

  ExItem.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    style = json['style'];
    status = json['status'];
    if (json['apps'] != null) {
      apps = [];
      json['apps'].forEach((v) {
        apps?.add(AppItem.fromJson(v));
      });
    }
  }

  int? id;
  String? name;
  int? style;
  int? status;
  List<AppItem>? apps;

  ExItem copyWith({
    int? id,
    String? name,
    int? style,
    int? status,
    List<AppItem>? apps,
  }) =>
      ExItem(
        id: id ?? this.id,
        name: name ?? this.name,
        style: style ?? this.style,
        status: status ?? this.status,
        apps: apps ?? this.apps,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['style'] = style;
    map['status'] = status;
    if (apps != null) {
      map['apps'] = apps?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

// AppItem appsFromJson(String str) => AppItem.fromJson(json.decode(str));

// String appsToJson(AppItem data) => json.encode(data.toJson());

class AppItem {
  AppItem({
    this.id,
    this.name,
    this.icon,
    this.type,
    this.appUrl,
    this.slogan,
    this.email,
    this.phone,
    this.realName,
  });

  AppItem.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    type = json['type'];
    appUrl = json['app_url'];
    slogan = json['slogan'];
    email = json['email'];
    phone = json['phone'];
    realName = json['real_name'];
  }

  int? id;
  String? name;
  String? icon;
  int? type;
  String? appUrl;
  String? slogan;
  int? email;
  int? phone;
  int? realName;

  AppItem copyWith({
    int? id,
    String? name,
    String? icon,
    int? type,
    String? appUrl,
    String? slogan,
    int? email,
    int? phone,
    int? realName,
  }) =>
      AppItem(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        type: type ?? this.type,
        appUrl: appUrl ?? this.appUrl,
        slogan: slogan ?? this.slogan,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        realName: realName ?? this.realName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['type'] = type;
    map['app_url'] = appUrl;
    map['slogan'] = slogan;
    map['email'] = email;
    map['phone'] = phone;
    map['real_name'] = realName;
    return map;
  }
}
