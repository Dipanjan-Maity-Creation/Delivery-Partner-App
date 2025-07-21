import 'package:flutter/material.dart';
import 'package:yaammy_delivery/confirm_pickup_screen.dart'; // Import your PickupOrderPage

class NewMapDetailsPage extends StatelessWidget {
  const NewMapDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar remains unchanged
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Order #8472',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: Stack(
        children: [
          // Demo rectangle covering the full screen in place of a map
          Positioned.fill(
            child: Container(
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'Map Demo',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),

          // Top info card overlay, moved upward for better appearance
          Positioned(
            top: 20,
            left: 16,
            right: 16,
            child: _buildTopInfoCard(),
          ),

          // Bottom info card overlay
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: _buildBottomInfoCard(context),
          ),
        ],
      ),
    );
  }

  // Builds the top info card with restaurant name, address, time, and distance.
  Widget _buildTopInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Left column: restaurant name + address.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Artisan Kitchen',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '1234 Culinary Ave, San Francisco',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            // Right column: time + distance with larger "12 min" text.
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '12 min',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[600],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '2.3 miles',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Builds the bottom info card with destination info and "I've Arrived" button.
  Widget _buildBottomInfoCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Destination text.
            Row(
              children: const [
                Text(
                  'Destination in ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '0.1 miles',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // "I've Arrived" button.
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to PickupOrderPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PickupOrderPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "I've Arrived",
                  style: TextStyle(
                    fontFamily: 'Roboto',
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
