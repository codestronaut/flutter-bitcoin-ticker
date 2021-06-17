import 'package:bitcoin_ticker/data/coin_data.dart';
import 'package:bitcoin_ticker/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                children: [
                  Expanded(
                    child: SolidCard(text: '1 BTC'),
                  ),
                  Expanded(
                    child: OutlinedCard(text: '? USD'),
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
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (selectedIndex) {
                  print(selectedIndex);
                },
                children: [
                  for (var currency in currenciesList) Text(currency),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}