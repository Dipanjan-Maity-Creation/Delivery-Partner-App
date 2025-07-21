import 'package:flutter/material.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  // Card displaying total earnings with a subtle gradient background.
  Widget _buildTotalEarningsCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color.fromRGBO(52, 168, 83, 1), Color.fromRGBO(52, 168, 83, 0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Total Earnings",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "₹1,234.56",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List tile for a single transaction.
  Widget _buildTransactionItem(String date, String description, String amount) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          description,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 14,
            color: Color.fromRGBO(75, 85, 99, 1),
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        trailing: Text(
          amount,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Card for displaying weekly/monthly report details.
  Widget _buildReportCard(String title, String reportSummary) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(52, 168, 83, 1),
              ),
            ),
            const Spacer(),
            Text(
              reportSummary,
              style: const TextStyle(
                fontFamily: "Roboto",
                fontSize: 14,
                color: Color.fromRGBO(75, 85, 99, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Earnings",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Earnings Card
            _buildTotalEarningsCard(),
            const SizedBox(height: 16),
            // Recent Transactions Section
            const Text(
              "Recent Transactions",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(52, 168, 83, 1),
              ),
            ),
            const SizedBox(height: 8),
            _buildTransactionItem("12 July 2025", "Order #5678 - Delivered", "₹25.00"),
            _buildTransactionItem("11 July 2025", "Order #5677 - Delivered", "₹30.00"),
            _buildTransactionItem("10 July 2025", "Order #5676 - Delivered", "₹18.50"),
            const SizedBox(height: 16),
            // Reports Section
            const Text(
              "Reports",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(52, 168, 83, 1),
              ),
            ),
            _buildReportCard("Weekly Report", "₹350.00"),
            _buildReportCard("Monthly Report", "₹1,200.00"),
            const SizedBox(height: 40),
            // Withdraw Option (Add Money removed)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Withdraw logic here.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Withdraw",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
