import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  final int balance = 100; // Simulated wallet balance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solde compte'),
        backgroundColor: Color.fromRGBO(121, 60, 72, 1),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.account_balance_wallet,
                    size: 40, color: Colors.orange),
                title: Text('Your Solde'),
                subtitle: Text('0 Dhs'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Add money',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                MoneyButton(amount: 100),
                MoneyButton(amount: 500),
                MoneyButton(amount: 1000),
                MoneyButton(amount: 2000),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add Money'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoneyButton extends StatelessWidget {
  final int amount;

  const MoneyButton({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('$amount Dhs'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}
