import 'package:flutter/material.dart';

import '../data/data_source/api.dart';
import '../data/data_source/response_model.dart';
import '../data/models/crypto_models/all_crypto_model.dart';
import '../data/models/crypto_models/crypto_data.dart';

class MarketScreenProvider extends ChangeNotifier {
  final Api _api = Api();

  late ResponseModel state;
  late AllCryptoModel cryptoData;
  late List<CryptoData> foundList;
  var response;

  int _filterIndex = 0;

  get filterIndex => _filterIndex;

  void setFilterIndex(int index) {
    _filterIndex = index;
    notifyListeners();
  }

  getAllCryptoData() async {
    state = ResponseModel.loading();
    try {
      response = await _api.getAllCryptoData();
      if (response.statusCode == 200) {
        cryptoData = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(cryptoData);
        foundList = cryptoData.data!.cryptoCurrencyList!;
      } else {
        state = ResponseModel.error("something wrong please try again...");
      }
      notifyListeners();
    } catch (e) {
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }

  getTopGainersData() async {
    state = ResponseModel.loading();
    try {
      response = await _api.getTopGainersData();
      if (response.statusCode == 200) {
        cryptoData = AllCryptoModel.fromJson(response.data);
        foundList = cryptoData.data!.cryptoCurrencyList!;
        state = ResponseModel.completed(cryptoData);
      } else {
        state = ResponseModel.error("something wrong please try again...");
      }
      notifyListeners();
    } catch (e) {
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }

  getTopLosersData() async {
    state = ResponseModel.loading();
    try {
      response = await _api.getTopLosersData();
      if (response.statusCode == 200) {
        cryptoData = AllCryptoModel.fromJson(response.data);
        foundList = cryptoData.data!.cryptoCurrencyList!;
        state = ResponseModel.completed(cryptoData);
      } else {
        state = ResponseModel.error("something wrong please try again...");
      }
      notifyListeners();
    } catch (e) {
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }

  configSearch(String value) {
    if (value.isEmpty) {
      foundList = cryptoData.data!.cryptoCurrencyList!;
    } else {
      foundList = cryptoData.data!.cryptoCurrencyList!
          .where((item) =>
              item.name!.toLowerCase().contains(value) ||
              item.symbol!.toLowerCase().contains(value))
          .toList();
    }
    notifyListeners();
  }
}
