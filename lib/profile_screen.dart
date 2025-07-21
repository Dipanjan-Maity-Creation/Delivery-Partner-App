import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Builds the profile header with user details.
  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromRGBO(52, 168, 83, 1), Color.fromRGBO(52, 168, 83, 0.85)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "John Doe",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "+91 9876543210",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "john.doe@example.com",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  // Helper to create an information card with an icon, title, and content.
  Widget _buildInfoCard(String title, String content, {IconData? icon}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10), // Consistent spacing
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color.fromRGBO(52, 168, 83, 1)),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(41, 45, 50, 1),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Color.fromRGBO(75, 85, 99, 1),
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

  // Edit Profile button.
  Widget _buildEditProfileButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {
          // Navigate to Edit Profile Screen.
        },
        icon: const Icon(Icons.edit, color: Colors.white),
        label: const Text(
          "Edit Profile",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  // Logout button.
  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle logout logic.
        },
        icon: const Icon(Icons.logout, color: Colors.white),
        label: const Text(
          "Log Out",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  // Main build method.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profile",
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
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildEditProfileButton(),
            const SizedBox(height: 24),

            // Vehicle Details Section
            _buildInfoCard("Vehicle Type", "Bike", icon: Icons.motorcycle),
            _buildInfoCard("Vehicle Number", "MH12 AB 1234", icon: Icons.confirmation_number),
            const SizedBox(height: 10),

            // Document Status Section
            _buildInfoCard("Driving License", "Verified", icon: Icons.verified),
            const SizedBox(height: 10),

            // Support Section
            _buildInfoCard("Contact Support", "Call or email support", icon: Icons.support_agent),
            const SizedBox(height: 10),

            // Additional Options
            _buildInfoCard("Terms & Conditions", "View details", icon: Icons.description),
            _buildInfoCard("Privacy Policy", "View details", icon: Icons.privacy_tip),
            _buildInfoCard("Ask for Leave", "Submit request", icon: Icons.calendar_today),
            const SizedBox(height: 24),

            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }
}
