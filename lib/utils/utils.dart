class Utils {
  static String baseURL = "https://rest.coinapi.io/v1/exchangerate";
  static String apiKey = "702ACD4C-A8F8-486D-92F9-7BB0E76F2339";

  static String getCryptoRateURL({
    required String crypto,
    required String currency,
  }) {
    return '$baseURL/$crypto/$currency';
  }
}
