import 'package:cripto_currency_app_flutter/network/api.dart';
import 'package:flutter/material.dart';
import '../models/crypto_models/all_crypto_model.dart';
import '../network/response_model.dart';

class MarketScreenProvider extends ChangeNotifier {
  final Api _api = Api();

  late AllCryptoModel cryptoData;
  late ResponseModel state;
  var response;

  getCryptoData() async {
    state = ResponseModel.loading();
    try {
      response = await _api.getAllCryptoData();
      if (response.statusCode == 200) {
        cryptoData = AllCryptoModel.fromJson(response.data);
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
}
