import 'package:flutter/material.dart';

class DocumentVerificationPendingScreen extends StatelessWidget {
  const DocumentVerificationPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated verification icon
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.hourglass_top_rounded,
                      size: 60,
                      color: Color.fromRGBO(52, 168, 83, 1),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Your documents are under verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "We are reviewing your submitted documents. "
                      "You will be notified once the verification is complete.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        color: Color.fromRGBO(75, 85, 99, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Loader Animation
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromRGBO(52, 168, 83, 1),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "This may take up to 24 hours...",
              textAlign: TextAlign.center,
              style: TextStyle(
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
}
