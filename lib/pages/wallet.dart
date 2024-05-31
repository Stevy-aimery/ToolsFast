import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  final int balance = 100; // Simulated wallet balance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Center(
        child: Text('Wallet Balance: \$${balance.toString()}'),
      ),
    );
  }
}
