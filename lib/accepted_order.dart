import 'package:flutter/material.dart';
import 'package:yaammy_delivery/live_tracking.dart'; // Added to reference NewMapDetailsPage from live_tracking.dart

// Just for demonstration, we reference a 'NewMapDetailsPage' class.
// Ensure you have defined NewMapDetailsPage somewhere in your project.
// class NewMapDetailsPage extends StatelessWidget {
//   const NewMapDetailsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           'New Map Details Page',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class NewOrderDetailsPage extends StatelessWidget {
  const NewOrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with back arrow and "Active" status on the right
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Order Details',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Active',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top row: Order ID & estimated time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order ID\n#OR78392',
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '25-30 min',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Order Items
                    _buildOrderItem(
                      'Grilled Chicken Sandwich x1',
                      'No mayo, extra lettuce',
                    ),
                    const SizedBox(height: 10),
                    _buildOrderItem(
                      'Caesar Salad x1',
                      'Dressing on side',
                    ),
                    const SizedBox(height: 16),
                    // Pricing details
                    _buildPriceRow('Subtotal', '\$24.98'),
                    _buildPriceRow('Tax', '\$2.00'),
                    _buildPriceRow('Delivery Fee', '\$3.99'),
                    _buildPriceRow('Customer Tip', '\$4.00'),
                    const SizedBox(height: 8),
                    const Divider(height: 1),
                    const SizedBox(height: 8),
                    _buildPriceRow('Total', '\$34.97', bold: true, fontSize: 16),
                  ],
                ),
              ),
            ),

            // Pickup Information Section with updated non-pressable Call & Chat buttons
            const PickupInformationCard(),

            // Customer Information Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Customer Information',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Michael Anderson',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '(555) 123-4567',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // TODO: Add call functionality
                          },
                          icon: const Icon(Icons.phone, color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '456 Park Avenue, Apt 7B',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // Bottom Buttons Section
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Start Delivery Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to NewMapDetailsPage when Start Delivery is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewMapDetailsPage(),
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
                  'Start Delivery',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Report Issue Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  // TODO: Add Report Issue logic
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: Color.fromRGBO(52, 168, 83, 1),
                    width: 2,
                  ),
                ),
                child: const Text(
                  'Report Issue',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color.fromRGBO(52, 168, 83, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper: Build a single order item.
  Widget _buildOrderItem(String mainText, String subText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainText,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subText,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Helper: Build a row for Subtotal, Tax, Delivery Fee, etc.
  Widget _buildPriceRow(String label, String value, {bool bold = false, double fontSize = 14}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: fontSize,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: fontSize,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// The updated PickupInformationCard with non-pressable Call and Chat buttons
class PickupInformationCard extends StatefulWidget {
  const PickupInformationCard({super.key});

  @override
  State<PickupInformationCard> createState() => _PickupInformationCardState();
}

class _PickupInformationCardState extends State<PickupInformationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pickup Information',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Restaurant Icon
                const Icon(
                  Icons.restaurant,
                  size: 40,
                  color: Color.fromRGBO(52, 168, 83, 1),
                ),
                const SizedBox(width: 12),
                // Restaurant Name and Address
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Restaurant A',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '123 Main Street, New York, NY 10001',
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
            const SizedBox(height: 16),
            // Row with non-pressable Call and Chat buttons with green background and white text/icons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.call,
                      size: 18,
                      color: Colors.white,
                    ),
                    label: const Text('Call'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromRGBO(52, 168, 83, 1),
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      minimumSize: WidgetStateProperty.all(
                        const Size.fromHeight(40),
                      ),
                      side: WidgetStateProperty.all(BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: null,
                    icon: const Icon(
                      Icons.chat,
                      size: 18,
                      color: Colors.white,
                    ),
                    label: const Text('Chat'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromRGBO(52, 168, 83, 1),
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      minimumSize: WidgetStateProperty.all(
                        const Size.fromHeight(40),
                      ),
                      side: WidgetStateProperty.all(BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
