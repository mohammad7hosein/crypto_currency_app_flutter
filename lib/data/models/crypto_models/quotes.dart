import 'package:hive/hive.dart';

part 'quotes.g.dart';

@HiveType(typeId: 2)
class Quotes {
  Quotes({
    String? name,
    double? price,
    double? percentChange24h,
    double? percentChange7d,
    double? percentChange30d,
    double? marketCapByTotalSupply,
  }) {
    _name = name;
    _price = price;
    _percentChange24h = percentChange24h;
    _percentChange7d = percentChange7d;
    _percentChange30d = percentChange30d;
    _marketCapByTotalSupply = marketCapByTotalSupply;
  }

  Quotes.fromJson(dynamic json) {
    _name = json['name'];
    _price = json['price'];
    _percentChange24h = json['percentChange24h'];
    _percentChange7d = json['percentChange7d'];
    _percentChange30d = json['percentChange30d'];
    _marketCapByTotalSupply = json['marketCapByTotalSupply'];
  }

  @HiveField(1)
  String? _name;
  @HiveField(2)
  double? _price;
  @HiveField(3)
  double? _percentChange24h;
  @HiveField(4)
  double? _percentChange7d;
  @HiveField(5)
  double? _percentChange30d;
  @HiveField(6)
  double? _percentChange60d;
  @HiveField(7)
  double? _marketCapByTotalSupply;

  String? get name => _name;

  double? get price => _price;

  double? get percentChange24h => _percentChange24h;

  double? get percentChange7d => _percentChange7d;

  double? get percentChange30d => _percentChange30d;

  double? get percentChange60d => _percentChange60d;

  double? get marketCapByTotalSupply => _marketCapByTotalSupply;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['price'] = _price;
    map['percentChange24h'] = _percentChange24h;
    map['percentChange7d'] = _percentChange7d;
    map['percentChange30d'] = _percentChange30d;
    map['percentChange60d'] = _percentChange60d;
    map['marketCapByTotalSupply'] = _marketCapByTotalSupply;

    return map;
  }
}
