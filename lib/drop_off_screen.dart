import 'package:flutter/material.dart';

class OrderDropoffPage extends StatelessWidget {
  const OrderDropoffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // White AppBar, centered title, with a leading arrow and trailing 3-dot menu
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Order #8472',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: More options logic
            },
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
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

          // Top overlay with time & distance
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: _buildTopInfoRow(),
          ),

          // Bottom card with customer info & buttons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomCard(context),
          ),
        ],
      ),
    );
  }

  // Builds the row near the top showing "12 mins" and "2.3 miles" in a small card
  Widget _buildTopInfoRow() {
    return Align(
      alignment: Alignment.topLeft,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Time
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.black54),
                  const SizedBox(width: 4),
                  Text(
                    '12 mins',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Distance
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 16, color: Colors.black54),
                  const SizedBox(width: 4),
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
      ),
    );
  }

  // Builds the bottom card with customer info & action buttons
  Widget _buildBottomCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        // Extra spacing at the bottom so the card fully shows
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Customer Name & Address
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text block
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sarah Thompson',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '1234 Maple Street, Apt 4B',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Delivery Note
            Row(
              children: [
                const Icon(Icons.check_circle, size: 18, color: Colors.green),
                const SizedBox(width: 6),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 4),
                    child: const Text(
                      'Please leave at door. Ring doorbell when delivered.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Call & Chat Buttons side by side
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Call Customer
                    },
                    icon: const Icon(Icons.call, size: 18),
                    label: const Text('Call Customer'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Chat Customer
                    },
                    icon: const Icon(Icons.chat, size: 18),
                    label: const Text('Chat Customer'),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color.fromRGBO(52, 168, 83, 1),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      foregroundColor: const Color.fromRGBO(52, 168, 83, 1),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Arrived at Drop-off button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Arrived logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Arrived at Drop-off',
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
