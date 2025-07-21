import 'package:flutter/material.dart';
import 'package:yaammy_delivery/SignUpPage.dart';
import 'package:yaammy_delivery/after_login.dart';

class JoinYaammyPage extends StatelessWidget {
  const JoinYaammyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A light background consistent with previous designs
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: SingleChildScrollView(
        // Increase top padding to shift everything downward
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            100,
            24,
            40,
          ), // Updated top padding from 80 to 100
          child: Column(
            children: [
              // The "Yaammy" text using the Salsa-Regular font
              Text(
                'Yaammy',
                style: TextStyle(
                  fontFamily: 'Salsa',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              const Text(
                'Join Yaammy Delivery Partners',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              // Descriptive text
              const Text(
                'Be your own boss and earn competitive income on your schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              // Sign Up button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Log In button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              // Feature cards
              _buildFeatureCard(
                icon: Icons.access_time_filled,
                title: 'Flexible Hours',
                subtitle: 'Work when you want, as much as you want',
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                icon: Icons.currency_rupee,
                title: 'Great Earnings',
                subtitle: 'Earn up to \$25/hour plus tips and bonuses',
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                icon: Icons.account_balance_wallet,
                title: 'Weekly Payments',
                subtitle: 'Get paid weekly, directly to your bank account',
              ),
              const SizedBox(height: 32),
              // Footer with version & copyright
              const SizedBox(height: 90), // Increased spacing from 32 to 40
              Text(
                'Yaammy Delivery Partner App v1.0.0',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '© 2024 Yaammy. All rights reserved.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a feature row/card
  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Subtle shadow for a polished look
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon on the left
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.green),
          ),
          const SizedBox(width: 16),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
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
    );
  }
}
