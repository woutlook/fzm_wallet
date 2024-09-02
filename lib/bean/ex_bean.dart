import 'dart:convert';

ExBean exBeanFromJson(String str) => ExBean.fromJson(json.decode(str));

String exBeanToJson(ExBean data) => json.encode(data.toJson());

class ExBean {
  ExBean({
    this.id,
    this.name,
    this.style,
    this.status,
    this.apps,
  });

  ExBean.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    style = json['style'];
    status = json['status'];
    if (json['apps'] != null) {
      apps = [];
      json['apps'].forEach((v) {
        apps?.add(Apps.fromJson(v));
      });
    }
  }

  int? id;
  String? name;
  int? style;
  int? status;
  List<Apps>? apps;

  ExBean copyWith({
    int? id,
    String? name,
    int? style,
    int? status,
    List<Apps>? apps,
  }) =>
      ExBean(
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

Apps appsFromJson(String str) => Apps.fromJson(json.decode(str));

String appsToJson(Apps data) => json.encode(data.toJson());

class Apps {
  Apps({
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

  Apps.fromJson(dynamic json) {
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

  Apps copyWith({
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
      Apps(
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
