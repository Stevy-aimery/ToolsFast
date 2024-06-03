import 'package:flutter/material.dart';

class SeeCompte extends StatelessWidget {
  const SeeCompte({super.key});

  @override
  Widget build(BuildContext context) {
    final int balance = 50; // Balance variable moved inside the build method

    return Scaffold(
      appBar: AppBar(
        title: Text('See Your Solde', style : TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(121, 60, 72, 1),
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
                    size: 50, color: Colors.orange),
                title: Text('Your Solde', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('$balance Dhs',  style : TextStyle(fontWeight: FontWeight.bold)),
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
                child: Text('Add Money', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(121, 60, 72, 1),
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
