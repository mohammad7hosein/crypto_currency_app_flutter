import 'package:hive/hive.dart';

import 'quotes.dart';

part 'crypto_data.g.dart';

@HiveType(typeId: 1)
class CryptoData {
  CryptoData({
    int? id,
    String? name,
    String? symbol,
    double? circulatingSupply,
    List<Quotes>? quotes,
  }) {
    _id = id;
    _name = name;
    _symbol = symbol;
    _circulatingSupply = circulatingSupply;
    _quotes = quotes;
  }

  CryptoData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _symbol = json['symbol'];
    _circulatingSupply = json['circulatingSupply'].toDouble();
    if (json['quotes'] != null) {
      _quotes = [];
      json['quotes'].forEach((v) {
        _quotes?.add(Quotes.fromJson(v));
      });
    }
  }

  @HiveField(1)
  int? _id;
  @HiveField(2)
  String? _name;
  @HiveField(3)
  String? _symbol;
  @HiveField(4)
  double? _circulatingSupply;
  @HiveField(5)
  List<Quotes>? _quotes;
  @HiveField(6)
  bool isMark = false;

  int? get id => _id;

  String? get name => _name;

  String? get symbol => _symbol;

  double? get circulatingSupply => _circulatingSupply;

  List<Quotes>? get quotes => _quotes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['symbol'] = _symbol;
    map['circulatingSupply'] = _circulatingSupply;
    if (_quotes != null) {
      map['quotes'] = _quotes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
