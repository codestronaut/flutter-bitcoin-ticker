import 'dart:io' show Platform;

import 'package:bitcoin_ticker/data/coin_data.dart';
import 'package:bitcoin_ticker/screens/widgets/widgets.dart';
import 'package:bitcoin_ticker/services/network_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NetworkHelper _networkHelper = NetworkHelper();
  String selectedCrypto = 'BTC';
  String selectedCurrency = 'USD';
  double? exchangeRate = 0.0;

  void getRate({
    required String crypto,
    required String currency,
  }) async {
    double? rate = await _networkHelper.getCryptoRate(
      crypto: crypto,
      currency: currency,
    );

    setState(() {
      exchangeRate = rate!;
    });
  }

  @override
  void initState() {
    super.initState();
    getRate(
      crypto: selectedCrypto,
      currency: selectedCurrency,
    );
  }

  DropdownButton<String> _getAndroidCurrencyPicker() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (var currency in currenciesList) {
      dropdownItems.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton(
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });

        getRate(crypto: selectedCrypto, currency: selectedCurrency);
      },
    );
  }

  DropdownButton<String> _getAndroidCryptoPicker() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (var crypto in cryptoList) {
      dropdownItems.add(
        DropdownMenuItem(
          child: Text(crypto),
          value: crypto,
        ),
      );
    }

    return DropdownButton(
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });

        getRate(crypto: selectedCrypto, currency: selectedCurrency);
      },
    );
  }

  CupertinoPicker _getIosCurrencyPicker() {
    List<Text> pirckerItems = [];
    for (var currency in currenciesList) {
      pirckerItems.add(
        Text(currency),
      );
    }

    return CupertinoPicker(
      itemExtent: 36.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });

        getRate(crypto: selectedCrypto, currency: selectedCurrency);
      },
      children: pirckerItems,
    );
  }

  CupertinoPicker _getIosCryptoPicker() {
    List<Text> pirckerItems = [];
    for (var crypto in cryptoList) {
      pirckerItems.add(
        Text(crypto),
      );
    }

    return CupertinoPicker(
      itemExtent: 36.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCrypto = cryptoList[selectedIndex];
        });

        getRate(crypto: selectedCrypto, currency: selectedCurrency);
      },
      children: pirckerItems,
    );
  }

  Widget getCurrencyPicker() {
    if (Platform.isIOS) {
      return _getIosCurrencyPicker();
    }

    return _getAndroidCurrencyPicker();
  }

  Widget getCryptoPicker() {
    if (Platform.isIOS) {
      return _getIosCryptoPicker();
    }
    return _getAndroidCryptoPicker();
  }

  @override
  Widget build(BuildContext context) {
    print(selectedCrypto);
    print(selectedCurrency);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coin Ticker',
          style: GoogleFonts.nunito(),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(
                24.0,
              ),
              child: Column(
                children: [
                  SolidCard(text: '1 $selectedCrypto'),
                  OutlinedCard(
                    text: exchangeRate!.toStringAsFixed(2),
                    postfix: selectedCurrency,
                  ),
                ],
              ),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                bottom: 32.0,
              ),
              color: Colors.cyan,
              child: Row(
                children: [
                  Expanded(child: getCryptoPicker()),
                  Expanded(child: getCurrencyPicker()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
