import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const emeraldGreen = Color(0xFF50C878);
    const backgroundColor = Color(0xFF121212);
    const cardColor = Color(0xFF1E1E1E);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Scan receipt action
        },
        backgroundColor: emeraldGreen,
        icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
        label: const Text('Scan Receipt', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Spending Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Spending',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '\$1,234.56',
                    style: TextStyle(
                      color: emeraldGreen,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            // Recent Transactions Header
            const Text(
              'Recent Transactions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            // Transactions List
            _buildTransactionItem('Starbucks', 'Today, 9:41 AM', '-\$5.50', cardColor),
            _buildTransactionItem('Uber', 'Yesterday, 6:30 PM', '-\$12.25', cardColor),
            _buildTransactionItem('Grocery Store', 'Oct 24, 2:15 PM', '-\$64.90', cardColor),
            _buildTransactionItem('Amazon', 'Oct 23, 10:00 AM', '-\$29.99', cardColor),
            _buildTransactionItem('Netflix', 'Oct 20, 9:00 AM', '-\$15.99', cardColor),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(String title, String subtitle, String amount, Color cardColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white10,
          child: Icon(Icons.receipt, color: Colors.white70),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
