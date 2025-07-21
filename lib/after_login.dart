import 'package:flutter/material.dart';
import 'package:yaammy_delivery/forgot_password.dart';
import 'package:yaammy_delivery/SignUpPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoginEnabled = false;

  void _updateLoginButtonState() {
    setState(() {
      _isLoginEnabled =
          _emailOrPhoneController.text.trim().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailOrPhoneController.addListener(_updateLoginButtonState);
    _passwordController.addListener(_updateLoginButtonState);
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Builds an input field with a white box style.
  Widget _buildInputField({
    required IconData icon,
    required String hint,
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 120, // Increased top padding to shift content downward
          left: 24,
          right: 24,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            const Text(
              'Yaammy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontFamily: 'Salsa',
                fontSize: 34,
              ),
            ),
            const SizedBox(height: 8),
            // Subtitle
            const Text(
              'Welcome back! Please login to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(75, 85, 99, 1),
                fontFamily: 'Roboto',
                fontSize: 14,
                height: 2,
              ),
            ),
            const SizedBox(height: 24),
            // Email or Phone Number field
            _buildInputField(
              icon: Icons.mail_outline,
              hint: 'Email or Phone Number',
              controller: _emailOrPhoneController,
            ),
            // Password field
            _buildInputField(
              icon: Icons.lock_outline,
              hint: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            // Forgot Password - navigation logic added.
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 168, 83, 1),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Login Button (enabled only when both fields are filled)
            SizedBox(
              width: double.infinity,
              height: 53,
              child: ElevatedButton(
                onPressed: _isLoginEnabled ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    height: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Register Prompt with navigation logic to SignUpPage.
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    color: Color.fromRGBO(75, 85, 99, 1),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    height: 2,
                  ),
                  children: [
                    TextSpan(text: 'New to Yaammy?\n'),
                    TextSpan(
                      text: 'Register as Partner',
                      style: TextStyle(color: Color.fromRGBO(52, 168, 83, 1)),
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
