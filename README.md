🚴‍♂️ Yaammy – Delivery Partner App
The Yaammy Delivery Partner App is a powerful Flutter-based mobile application integrated with Firebase, crafted to simplify the daily operations of food and grocery delivery personnel. It provides seamless onboarding, document verification, and profile management, enabling individuals to join and thrive as delivery agents.

📌 Overview
This application streamlines the delivery partner journey with intuitive workflows, a responsive UI, and robust backend integration. It allows agents to securely sign up, upload required documents, track verification status, manage personal details, and contact support — all from a single mobile interface.

🚀 Key Features
🔐 Secure Registration & Onboarding
Firebase Authentication via phone number

Step-by-step onboarding with real-time form validation

📑 KYC Document Upload
Upload Aadhaar, PAN, Passbook, License, RC, and Insurance

Replace, remove, and validate documents easily

Ensures all documents are uploaded before proceeding

👤 Profile Management
View and update personal and vehicle details

Display verification status with dynamic UI changes

Secure logout functionality

📆 Leave Requests & Support
Submit leave requests via the app

Contact support by call or email (using url_launcher)

View in-app Privacy Policy and Terms & Conditions

🔁 Dynamic Workflow
Auto-navigation from upload to “Verification Pending”

On admin approval, redirects to dashboard

Built for future integration with live delivery tracking

🧱 Tech Stack
Layer	Technology
Frontend	Flutter (Dart), Material UI
Backend	Firebase Auth, Firestore, Storage
Media Upload	image_picker, firebase_storage
Navigation	MaterialPageRoute, pushReplacement
Utils	Google Fonts, Custom Widgets

🗂️ Directory Structure
csharp
Copy
Edit
lib/
├── main.dart                     # App entry point
├── login.dart                    # Phone authentication
├── upload_documents.dart         # KYC document uploads
├── verification_pending.dart     # Pending status screen
├── dashboard.dart                # Partner overview
├── edit_profile.dart             # Update personal details
├── leave_request.dart            # Leave submission form
├── contact_support.dart          # Contact options
├── policy_pages.dart             # Legal documents
└── utils/                        # Shared constants, error messages
🔐 Firestore Rules (Example)
js
Copy
Edit
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /DeliveryPartners/{uid}/{document=**} {
      allow read, write: if request.auth != null && request.auth.uid == uid;
    }
  }
}
🛠️ Getting Started
✅ Prerequisites
Flutter SDK (latest stable version)

Firebase Project with:

Authentication (Phone)

Firestore Database

Cloud Storage

⚙️ Installation
bash
Copy
Edit
git clone https://github.com/your-username/yaammy_delivery_partner.git
cd yaammy_delivery_partner
flutter pub get
Add your Firebase configuration files:

google-services.json for Android (android/app/)

GoogleService-Info.plist for iOS (ios/Runner/)

▶️ Run the App
bash
Copy
Edit
flutter run
🌟 Future Enhancements
📍 Live location tracking and delivery route assignment

💸 Earnings dashboard with transaction history

⭐ Ratings, reviews, and performance analytics

🔔 Push notifications for delivery updates via FCM

🧾 Admin approval panel for document validation

🤝 Contributing
We welcome contributions to improve the project!

bash
Copy
Edit
# Fork the repository
git checkout -b feature/your-feature-name

# Make changes and commit
git commit -m "Add your feature"

# Push to your branch
git push origin feature/your-feature-name

# Open a Pull Request 🚀
📄 License
This project is licensed under the MIT License.
See the LICENSE file for more information.

📬 Contact
Email: yaammyfood@gmail.com
Phone: +91 84360 89071
