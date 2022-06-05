import 'package:crypto_api_demo/screens/coin_main_screen.dart';
import 'package:flutter/material.dart';

Future main() async {
  runApp(
    const CryptoApiDemo(),
  );
}

class CryptoApiDemo extends StatelessWidget {
  const CryptoApiDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: CoinAppDemo());
  }
}
