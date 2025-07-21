import 'package:flutter/material.dart';
import 'package:yaammy_delivery/drop_off_screen.dart';

class PickupOrderPage extends StatefulWidget {
  const PickupOrderPage({super.key});

  @override
  State<PickupOrderPage> createState() => _PickupOrderPageState();
}

class _PickupOrderPageState extends State<PickupOrderPage> {
  // Sample list of items with checkbox states
  final List<_Item> _items = [
    _Item(name: 'Original Burger', details: 'Medium rare, extra cheese', quantity: 2, checked: false),
    _Item(name: 'Grilled Lobster', details: 'Lemon butter sauce', quantity: 1, checked: false),
    _Item(name: 'Truffle Fries', details: 'Large portion', quantity: 1, checked: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // White AppBar with centered title
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pickup Order #2847',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // Center the text
      ),
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Summary',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '4 items • \$86.50',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.info_outline, size: 16, color: Colors.black54),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Please ensure all sauces are included',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Verify Items Section enclosed in one box
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Verify Items',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Display each item row without individual boxes
                    Column(
                      children: _items
                          .map((item) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: _buildItemRow(item),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Confirm Pickup Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderDropoffPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirm Pickup',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Report Missing Items Button with border weight 1
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  // TODO: Report missing items logic
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: Color.fromRGBO(52, 168, 83, 1),
                    width: 1, // Border weight 1
                  ),
                ),
                child: const Text(
                  'Report Missing Items',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color.fromRGBO(52, 168, 83, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Centered Support Section
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.support_agent, size: 18, color: Colors.grey),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      // TODO: Support logic
                    },
                    child: const Text(
                      'Support',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds a row for each item with a checkbox, name, details, and boxed quantity
  Widget _buildItemRow(_Item item) {
    return Row(
      children: [
        // Checkbox
        Checkbox(
          value: item.checked,
          onChanged: (val) {
            setState(() {
              item.checked = val ?? false;
            });
          },
          activeColor: const Color.fromRGBO(52, 168, 83, 1),
        ),
        // Item Name and details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (item.details.isNotEmpty)
                Text(
                  item.details,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
            ],
          ),
        ),
        // Quantity in a boxed style
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
          child: Text(
            'x${item.quantity}',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}

// Simple class to hold item data
class _Item {
  String name;
  String details;
  int quantity;
  bool checked;

  _Item({
    required this.name,
    required this.details,
    required this.quantity,
    required this.checked,
  });
}

