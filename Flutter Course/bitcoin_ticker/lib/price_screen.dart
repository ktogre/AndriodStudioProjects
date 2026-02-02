import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

const apiKey = 'CG-qkNguPHzgpSU53nE76Ld423K';
const coinGeckoUrl = 'https://api.coingecko.com/api/v3/simple/price';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  // https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,litecoin&vs_currencies=usd&x_cg_demo_api_key=API-KEY-HERE

  String? bitcoinPrice;
  String? ethereumPrice;
  String? litecoinPrice;
  String? defaultPrice = '? USD';
  String? selectedCurrency = 'usd';

  @override
  void initState() {
    super.initState();
    getCurrenciesData();
  }

  Future<dynamic> getCurrenciesData() async {
    var currencies = currenciesList.join(',').toLowerCase();

    CoinData coinData = CoinData(
      '$coinGeckoUrl?ids=bitcoin,ethereum,litecoin&vs_currencies=$currencies&x_cg_demo_api_key=$apiKey',
    );

    var currenciesData = await coinData.getCoinData();

    bitcoinPrice = currenciesData['bitcoin'][selectedCurrency].toString();
    ethereumPrice = currenciesData['ethereum'][selectedCurrency].toString();
    litecoinPrice = currenciesData['litecoin'][selectedCurrency].toString();
  }

  // For Android devices
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(value: currency, child: Text(currency));
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value ?? '';
          if (bitcoinPrice != null && selectedCurrency == 'GBP') {
            defaultPrice = bitcoinPrice;
          } else {
            selectedCurrency = value ?? '';
          }
        });
      },
    );
  }

  // For iOS devices
  CupertinoPicker iOSPicker() {
    List<Text> cupertinoPickerItems = [];

    for (String currency in currenciesList) {
      var newItem = Text(currency);
      cupertinoPickerItems.add(newItem);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 40.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: cupertinoPickerItems,
    );
  }

  Widget getPicker() {
    if (Platform.isAndroid) {
      return androidDropdown();
    } else if (Platform.isIOS) {
      return iOSPicker();
    } else {
      return iOSPicker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🤑 Coin Ticker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Bitcoin Prices
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 ${cryptoList[0]} = $defaultPrice',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ),

              // Ethereum Prices
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 ${cryptoList[1]} = $defaultPrice',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ),

              // Litecoin Prices
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 28.0,
                    ),
                    child: Text(
                      '1 ${cryptoList[2]} = $defaultPrice',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: androidDropdown(),
          ),
        ],
      ),
    );
  }
}
