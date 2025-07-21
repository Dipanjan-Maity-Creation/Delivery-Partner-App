import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yaammy_delivery/otp_verification.dart';
import 'package:yaammy_delivery/after_login.dart'; // Assuming LoginScreen is defined here

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  String? _selectedVehicle;
  bool _isChecked = false;

  // Controllers to make fields mandatory
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Helper to determine if the form is valid (all required documents are provided)
  bool _isFormValid() {
    return _profileImage != null &&
        _selectedVehicle != null &&
        _nameController.text.trim().isNotEmpty &&
        _phoneController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _passwordController.text.trim().isNotEmpty &&
        _confirmPasswordController.text.trim().isNotEmpty &&
        _isChecked;
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Builds an input field with a white box style.
  Widget _buildInputField(
    IconData icon,
    String hint,
    TextEditingController controller, {
    bool obscureText = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.grey),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Builds a vehicle option box, highlighting it if selected, and allowing toggle.
  Widget _buildVehicleOption(IconData icon, String label) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            // Toggle selection: if already selected, deselect; otherwise select
            if (_selectedVehicle == label) {
              _selectedVehicle = null;
            } else {
              _selectedVehicle = label;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: _selectedVehicle == label ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 28,
                color: _selectedVehicle == label ? Colors.white : Colors.grey,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: _selectedVehicle == label
                      ? Colors.white
                      : const Color.fromRGBO(75, 85, 99, 1),
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 80,
          left: 24,
          right: 24,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title & Subtitle
            const Text(
              'Yaammy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontFamily: 'Salsa',
                fontSize: 34,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Partner Registration',
              style: TextStyle(
                color: Color.fromRGBO(75, 85, 99, 1),
                fontFamily: 'Roboto',
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            // Profile Picture with Camera Overlay
            Stack(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? const Icon(
                          Icons.person,
                          size: 42,
                          color: Colors.grey,
                        )
                      : null,
                ),
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: InkWell(
                    onTap: _pickImage,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(52, 168, 83, 1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Upload Profile Picture',
              style: TextStyle(
                color: Color.fromRGBO(75, 85, 99, 1),
                fontFamily: 'Roboto',
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            // Input Fields
            _buildInputField(Icons.person, 'Full Name', _nameController),
            const SizedBox(height: 16),
            _buildInputField(Icons.phone, 'Phone Number', _phoneController),
            const SizedBox(height: 16),
            _buildInputField(Icons.email, 'Email Address', _emailController),
            const SizedBox(height: 16),
            _buildInputField(
              Icons.lock,
              'Password',
              _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              Icons.lock_outline,
              'Confirm Password',
              _confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Vehicle Type selection
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Vehicle Type',
                style: TextStyle(
                  color: Color.fromRGBO(75, 85, 99, 1),
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildVehicleOption(Icons.electric_scooter, 'Scooter'),
                _buildVehicleOption(Icons.pedal_bike, 'Bicycle'),
                _buildVehicleOption(Icons.motorcycle, 'Motorcycle'),
              ],
            ),
            const SizedBox(height: 20),
            // Terms & Conditions with RichText
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    setState(() {
                      _isChecked = val!;
                    });
                  },
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Color.fromRGBO(75, 85, 99, 1),
                        fontFamily: 'Roboto',
                        fontSize: 14,
                      ),
                      children: [
                        const TextSpan(text: 'I agree to the '),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: const TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Register Button (enabled only if the form is valid)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isFormValid()
                    ? () {
                        if (_passwordController.text.trim() !=
                            _confirmPasswordController.text.trim()) {
                          // If passwords do not match, show the dark-themed pop-up
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.grey[900],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                title: const Text(
                                  'Password Mismatch',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                content: const Text(
                                  'Password and Confirm Password do not match.',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Pass the phone number to the OTP verification page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPVerificationPage(
                                phoneNumber: _phoneController.text,
                              ),
                            ),
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Register Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Login Text Button with RichText for styled "Log in"
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Color.fromRGBO(75, 85, 99, 1),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                  ),
                  children: [
                    const TextSpan(text: 'Already have an account? '),
                    TextSpan(
                      text: 'Log in',
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
