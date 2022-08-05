import 'package:flutter/material.dart';
import '../data/data_source/api.dart';
import '../data/data_source/response_model.dart';
import '../data/models/crypto_models/all_crypto_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  final Api _api = Api();

  late AllCryptoModel cryptoData;
  late ResponseModel state;
  var response;

  getTopMarketCapsData() async {
    state = ResponseModel.loading();
    try {
      response = await _api.getTopMarketCapsData();
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
