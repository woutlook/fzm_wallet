class ContactsAddress {
  String? coinId;
  String? address;

  ContactsAddress({
    this.coinId,
    this.address,
  });

  factory ContactsAddress.fromJson(Map<String, dynamic> json) {
    return ContactsAddress(
      coinId: json['coinId'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coinId': coinId,
      'address': address,
    };
  }
}

class Contact {
  String name;
  String phoneNum;
  List<ContactsAddress>? addressList = [];

  Contact({
    this.name = '',
    this.phoneNum = '',
    this.addressList,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      phoneNum: json['phoneNum'],
      addressList: (json['addressList'] as List)
          .map((e) => ContactsAddress.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNum': phoneNum,
      'addressList': addressList?.map((e) => e.toJson()).toList(),
    };
  }

  void addAddress(ContactsAddress address) {
    addressList ??= [];
    addressList?.add(address);
  }

  void rmAddress(ContactsAddress address) {
    addressList ??= [];
    addressList?.remove(address);
  }
}

class DBContects {
  int? id;
  final int walletId;
  final String name;
  final String phoneNum;
  final String coinId;
  final String address;

  DBContects({
    this.id,
    required this.walletId,
    required this.name,
    required this.phoneNum,
    required this.coinId,
    required this.address,
  });

  factory DBContects.fromJson(Map<String, dynamic> json) {
    return DBContects(
      id: json['id'],
      walletId: json['walletId'],
      name: json['name'],
      phoneNum: json['phoneNum'],
      coinId: json['coinId'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'walletId': walletId,
      'name': name,
      'phoneNum': phoneNum,
      'coinId': coinId,
      'address': address,
    };
  }
}
