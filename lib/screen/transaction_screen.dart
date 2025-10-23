import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // contoh data transaksi
    final List<Map<String, dynamic>> transactions = [
      {
        'image': 'assets/card1.png',
        'title': 'Master Card',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': 89,
      },
      {
        'image': 'assets/card2.png',
        'title': 'Visa Card',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': 109,
      },
      {
        'image': 'assets/card3.png',
        'title': 'Paypal',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': 567,
      },
      {
        'image': 'assets/card3.png',
        'title': 'Paypal',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': 567,
      },
      {
        'image': 'assets/card2.png',
        'title': 'Visa Card',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': 109,
      },
      {
        'image': 'assets/card1.png',
        'title': 'Master Card',
        'date': 'Dec 12 2021 at 10:00 pm',
        'amount': 89,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Transactions',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    transaction['image'],
                    width: 28, // ubah ukuran logo di sini
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              title: Text(
                transaction['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                transaction['date'],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              trailing: Text(
                '\$${transaction['amount']}',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
