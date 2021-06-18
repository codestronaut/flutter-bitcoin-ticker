import 'package:bitcoin_ticker/utils/utils.dart';
import 'package:dio/dio.dart';

class NetworkHelper {
  var _dio = Dio();

  Future<double?> getCryptoRate({
    required String crypto,
    required String currency,
  }) async {
    try {
      var response = await _dio.get(
        Utils.getCryptoRateURL(
          crypto: crypto,
          currency: currency,
        ),
        options: Options(
          headers: {
            'X-CoinAPI-Key': Utils.apiKey,
          },
        ),
      );

      return response.data['rate'];
    } catch (e) {
      print(e);
    }
  }
}
