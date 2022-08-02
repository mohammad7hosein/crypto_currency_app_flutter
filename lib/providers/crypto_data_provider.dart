import 'package:cripto_currency_app_flutter/models/crypto_models/all_crypto_model.dart';
import 'package:cripto_currency_app_flutter/network/api.dart';
import 'package:cripto_currency_app_flutter/network/response_model.dart';
import 'package:flutter/material.dart';

class CryptoDataProvider extends ChangeNotifier {
  Api api = Api();

  late AllCryptoModel cryptoData;
  late ResponseModel state;
  var response;

  getTopMarketCapData() async {
    state = ResponseModel.loading();
    try {
      response = await api.getTopMarketCapData();
      if (response.statusCode == 200) {
        cryptoData = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(cryptoData);
      } else {
        state = ResponseModel.error("something wrong...");
      }
      notifyListeners();
    } catch (e) {
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }
}
