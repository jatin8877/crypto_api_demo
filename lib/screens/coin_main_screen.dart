import 'dart:async';
import 'dart:convert';

import 'package:crypto_api_demo/models/coin_model.dart';
import 'package:crypto_api_demo/screens/coin_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinAppDemo extends StatefulWidget {
  const CoinAppDemo({Key? key}) : super(key: key);

  @override
  State<CoinAppDemo> createState() => _CoinAppDemoState();
}

class _CoinAppDemoState extends State<CoinAppDemo> {
  List<Coin> coinList = [];
  Future<List> getCoinDetails() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc'));
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.isNotEmpty) {
        for (var i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Please Check Internet Connection');
    }
  }

  void initState() {
    getCoinDetails();
    Timer.periodic(const Duration(seconds: 10), (timer) => getCoinDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 115, 255),
      appBar: AppBar(
        centerTitle: mounted,
        backgroundColor: const Color.fromRGBO(24, 27, 33, 1),
        title: const Text(
          'Crypto Currency App',
          style: TextStyle(
            color: Color.fromARGB(255, 229, 229, 229),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(Icons.currency_rupee),
      ),
      body: ListView.builder(
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          return CoinCard(
            name: coinList[index].name,
            symbol: coinList[index].symbol,
            imageUrl: coinList[index].imageUrl,
            price: coinList[index].price.toDouble(),
            change: coinList[index].change.toDouble(),
            changePercentage: coinList[index].changePercentage.toDouble(),
          );
        },
      ),
    );
  }
}
