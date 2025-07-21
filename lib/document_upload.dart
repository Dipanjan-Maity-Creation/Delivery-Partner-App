import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:yaammy_delivery/Dashboard.dart';
import 'package:yaammy_delivery/document_verification_pending.dart';

class DocumentVerificationScreen extends StatefulWidget {
  const DocumentVerificationScreen({super.key});

  @override
  _DocumentVerificationScreenState createState() => _DocumentVerificationScreenState();
}

class _DocumentVerificationScreenState extends State<DocumentVerificationScreen> {
  // Stores uploaded images
  Map<String, File?> uploadedImages = {};

  // List of required document keys.
  final List<String> requiredDocuments = ["aadhaar", "pan", "passbook", "license", "rc", "insurance"];

  // Function to pick an image from the gallery
  Future<void> _pickImage(String documentType) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        uploadedImages[documentType] = File(pickedFile.path);
      });
    }
  }

  // Function to remove an uploaded image
  void _removeImage(String documentType) {
    setState(() {
      uploadedImages.remove(documentType);
    });
  }

  // Check if all required documents are uploaded.
  bool _areAllDocumentsUploaded() {
    return requiredDocuments.every((doc) => uploadedImages[doc] != null);
  }

  // Builds a single document upload section with an image preview and delete button.
  Widget _buildDocumentSection(String title, String description, String documentType) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: Color.fromRGBO(75, 85, 99, 1),
              ),
            ),
            const SizedBox(height: 12),
            // Show uploaded image if available
            if (uploadedImages[documentType] != null)
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      uploadedImages[documentType]!,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => _removeImage(documentType),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.close, color: Colors.red, size: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 12),
            // Upload Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _pickImage(documentType),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  uploadedImages[documentType] == null ? "Upload" : "Replace Image",
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 250, 251, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Document Verification",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal Identification Section
            const Text(
              "Personal Identification",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(52, 168, 83, 1),
              ),
            ),
            _buildDocumentSection("Aadhaar Card", "Upload a clear image of your Aadhaar Card.", "aadhaar"),
            _buildDocumentSection("PAN Card", "Upload a clear image of your PAN Card.", "pan"),

            const SizedBox(height: 20),

            // Contact & Banking Details Section
            const Text(
              "Bank Details",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(52, 168, 83, 1),
              ),
            ),
            _buildDocumentSection("Passbook with Bank Details", "Upload a clear image of your bank passbook with account details.", "passbook"),

            const SizedBox(height: 20),

            // Vehicle Documents Section
            const Text(
              "Vehicle Documents",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(52, 168, 83, 1),
              ),
            ),
            _buildDocumentSection("Driving License", "Upload a clear image of your valid driving license.", "license"),
            _buildDocumentSection("Vehicle RC", "Upload a clear image of your vehicle's registration certificate.", "rc"),
            _buildDocumentSection("Insurance", "Upload a clear image of your vehicle's insurance policy.", "insurance"),

            const SizedBox(height: 40),

            // Submit Button with navigation logic to DocumentVerificationPendingScreen
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _areAllDocumentsUploaded()
                    ? () {
                        // Navigate to Document Verification Pending Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DocumentVerificationPendingScreen(),
                          ),
                        );

                        // Wait for 3 seconds and then navigate to OrderDashboard
                        Future.delayed(const Duration(seconds: 10), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderDashboard(),
                            ),
                          );
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(52, 168, 83, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Submit Documents",
                  style: TextStyle(
                    fontFamily: "Roboto",
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
