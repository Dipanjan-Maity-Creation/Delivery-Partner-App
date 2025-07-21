import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yaammy_delivery/accepted_order.dart'; // Assuming OrderDetailsPage is defined here
import 'package:yaammy_delivery/profile_screen.dart';
import 'package:yaammy_delivery/earnings_screen.dart';

class Order {
  final String orderId;
  final String pickup;
  final String dropoff;
  final String estimatedEarnings;
  final String remainingTime;
  final String distance;
  final bool hasCountdown;

  Order({
    required this.orderId,
    required this.pickup,
    required this.dropoff,
    required this.estimatedEarnings,
    required this.remainingTime,
    required this.distance,
    required this.hasCountdown,
  });
}

class OrderDashboard extends StatefulWidget {
  const OrderDashboard({super.key});

  @override
  State<OrderDashboard> createState() => _OrderDashboardState();
}

class _OrderDashboardState extends State<OrderDashboard> {
  int _selectedIndex = 0;
  bool _isOnline = true;

  // Stores the time user went offline.
  DateTime? _offlineStartTime;

  // Displays the last active time (e.g., "Today at 2:30 PM").
  String _lastActive = '';

  // Timer to update how long user has been offline.
  Timer? _offlineTimer;

  // Stores the current offline duration text (e.g., "1h 45m").
  String _offlineDurationText = '0m';

  final List<Order> _newOrders = [
    Order(
      orderId: 'Order #1234',
      pickup: 'Restaurant A',
      dropoff: 'Customer B',
      estimatedEarnings: '₹25',
      remainingTime: '10 min',
      distance: '1.2 km',
      hasCountdown: true,
    ),
    Order(
      orderId: 'Order #1235',
      pickup: 'Restaurant X',
      dropoff: 'Customer Y',
      estimatedEarnings: '₹25',
      remainingTime: '10 min',
      distance: '1.5 km',
      hasCountdown: true,
    ),
  ];

  final List<Order> _ongoingOrders = [];

  final List<Order> _deliveredOrders = [
    Order(
      orderId: 'Order #1230',
      pickup: 'Restaurant Q',
      dropoff: 'Customer W',
      estimatedEarnings: '₹25',
      remainingTime: 'N/A',
      distance: '1.8 km',
      hasCountdown: false,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EarningsScreen(),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    }
  }

  void _acceptOrder(Order order) {
    setState(() {
      _newOrders.remove(order);
      _ongoingOrders.add(Order(
        orderId: order.orderId,
        pickup: order.pickup,
        dropoff: order.dropoff,
        estimatedEarnings: order.estimatedEarnings,
        remainingTime: order.remainingTime,
        distance: order.distance,
        hasCountdown: false,
      ));
    });
  }

  void _declineOrder(Order order) {
    setState(() {
      _newOrders.remove(order);
    });
  }

  // Toggles the user's online/offline state.
  void _toggleOnline(bool newValue) {
    setState(() {
      _isOnline = newValue;
      if (!_isOnline) {
        // User just went offline
        _offlineStartTime = DateTime.now();
        final now = DateTime.now();
        final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
        final minute = now.minute.toString().padLeft(2, '0');
        final amPm = now.hour < 12 ? 'AM' : 'PM';
        _lastActive = 'Today at $hour:$minute $amPm';
        _offlineTimer?.cancel();
        _offlineTimer = Timer.periodic(const Duration(seconds: 1), (_) {
          // Update duration (not shown anymore, but logic remains)
          final duration = DateTime.now().difference(_offlineStartTime!);
          final hours = duration.inHours;
          final minutes = duration.inMinutes % 60;
          String result = '';
          if (hours > 0) result += '${hours}h ';
          if (minutes > 0) result += '${minutes}m';
          _offlineDurationText = result.trim();
        });
      } else {
        // User went online; stop tracking offline
        _offlineTimer?.cancel();
        _offlineTimer = null;
        _offlineStartTime = null;
        _offlineDurationText = '0m';
      }
    });
  }

  @override
  void dispose() {
    _offlineTimer?.cancel();
    super.dispose();
  }

  // New widget: Online/Offline toggle placed below the AppBar.
  Widget _buildOnlineOfflineToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _isOnline ? "Online" : "Offline",
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Color.fromRGBO(75, 85, 99, 1),
              ),
            ),
            Transform.scale(
              scale: 1.1,
              child: Switch(
                value: _isOnline,
                activeColor: const Color.fromRGBO(52, 168, 83, 1),
                onChanged: (bool newValue) {
                  _toggleOnline(newValue);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Improved offline UI: Remove "Last active" and offline duration.
  // Center the remaining content in the middle of the page.
  Widget _buildOfflineUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.wifi_off,
            size: 80,
            color: Colors.redAccent,
          ),
          SizedBox(height: 20),
          Text(
            "You are currently offline.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "You won't receive new orders until you go online.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              color: Color.fromRGBO(75, 85, 99, 1),
            ),
          ),
        ],
      ),
    );
  }

  // Online UI remains unchanged.
  Widget _buildOnlineUI() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Delivery Requests',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              color: Color.fromRGBO(52, 168, 83, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ..._newOrders.map((order) => OrderCard(
                orderId: order.orderId,
                pickup: order.pickup,
                dropoff: order.dropoff,
                estimatedEarnings: order.estimatedEarnings,
                remainingTime: order.remainingTime,
                distance: order.distance,
                hasCountdown: order.hasCountdown,
                buttonText: 'Accept Order',
                onButtonPressed: () {
                  _acceptOrder(order);
                },
                onDeclinePressed: () {
                  _declineOrder(order);
                },
              )),
          const SizedBox(height: 24),
          const Text(
            'Ongoing Deliveries',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              color: Color.fromRGBO(52, 168, 83, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ..._ongoingOrders.map((order) => OrderCard(
                orderId: order.orderId,
                pickup: order.pickup,
                dropoff: order.dropoff,
                estimatedEarnings: order.estimatedEarnings,
                remainingTime: order.remainingTime,
                distance: order.distance,
                hasCountdown: order.hasCountdown,
                buttonText: 'Update Status',
                onButtonPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewOrderDetailsPage(),
                    ),
                  );
                },
                onDeclinePressed: null,
              )),
          const SizedBox(height: 24),
          const Text(
            'Delivered Orders',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              color: Color.fromRGBO(52, 168, 83, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ..._deliveredOrders.map((order) => OrderCard(
                orderId: order.orderId,
                pickup: order.pickup,
                dropoff: order.dropoff,
                estimatedEarnings: order.estimatedEarnings,
                remainingTime: order.remainingTime,
                distance: order.distance,
                hasCountdown: order.hasCountdown,
                buttonText: 'View Details',
                onButtonPressed: () {},
                onDeclinePressed: null,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar without a back button.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Order Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 18,
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: Column(
        children: [
          // Online/Offline toggle widget below the AppBar.
          _buildOnlineOfflineToggle(),
          // Display online or offline UI based on _isOnline.
          Expanded(
            child: _isOnline ? _buildOnlineUI() : _buildOfflineUI(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromRGBO(52, 168, 83, 1),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Support',
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  final String orderId;
  final String pickup;
  final String dropoff;
  final String estimatedEarnings;
  final String remainingTime;
  final String distance;
  final bool hasCountdown;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final VoidCallback? onDeclinePressed;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.pickup,
    required this.dropoff,
    required this.estimatedEarnings,
    required this.remainingTime,
    required this.distance,
    required this.hasCountdown,
    required this.buttonText,
    required this.onButtonPressed,
    this.onDeclinePressed,
  });

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  double _progress = 1.0;
  late Timer _timer;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    if (widget.hasCountdown) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_progress > 0) {
            _progress -= 0.1;
          } else {
            timer.cancel();
            _isVisible = false;
          }
        });
      });
    }
  }

  @override
  void dispose() {
    if (widget.hasCountdown) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.orderId,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Pickup: ${widget.pickup}"),
            Text("Drop-off: ${widget.dropoff}"),
            const SizedBox(height: 8),
            Text(
              "Estimated Earnings: ${widget.estimatedEarnings}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Time Left: ${widget.remainingTime}",
                    style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Distance: ${widget.distance}",
                    style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
            if (widget.hasCountdown) ...[
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.redAccent),
              ),
              const SizedBox(height: 10),
            ],
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      widget.buttonText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                if (widget.onDeclinePressed != null) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: widget.onDeclinePressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Decline",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
