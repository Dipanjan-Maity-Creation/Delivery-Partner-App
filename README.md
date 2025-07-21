# 🚴‍♂️ Yaammy – Delivery Partner App

**Yaammy Delivery Partner App** is a robust, Flutter-based mobile solution designed for individuals to join as delivery agents for food, grocery, and package services. Integrated with Firebase for real-time backend operations, this app simplifies onboarding, document verification, and partner management.

---

## 🎯 Objective

To build a scalable, secure platform enabling delivery partners to:

- 📱 Register quickly with phone authentication  
- 📂 Upload and manage KYC and vehicle documents  
- ✅ Track verification status and delivery eligibility  
- 🧑‍💼 Manage personal and vehicle information  
- 📞 Access support and platform policies  

---

## 🚀 Key Features

### 🔐 Secure Registration & Onboarding
- Phone authentication using **Firebase Auth**
- Guided onboarding with validation
- Smart navigation based on verification status

### 📄 Document Upload & Verification
- Upload documents: Aadhaar, PAN, DL, RC, Insurance, Passbook
- Replace, preview, and delete files
- Document validation before proceeding

### 👤 Profile Management
- View/edit personal and vehicle details
- Display real-time verification status
- Secure logout and local storage clearance

### 📆 Leave Requests & Support
- Submit in-app leave requests
- Reach support via email or phone
- View Privacy Policy & Terms and Conditions

### 🔄 Smart Navigation Flow
- Auto-redirect after KYC to pending screen
- Dashboard shown after verification
- Built to integrate live orders in the future

---

## 🧱 Tech Stack

| Layer       | Technologies                             |
|-------------|-------------------------------------------|
| Frontend    | Flutter (Dart), Material Design           |
| Backend     | Firebase Auth, Firestore, Firebase Storage |
| Media Upload| `image_picker`, `firebase_storage`        |
| Navigation  | `MaterialPageRoute`, `pushReplacement`    |
| Utilities   | Google Fonts, Custom Widgets              |

---

## 🗂️ Folder Structure

lib/
├── main.dart # App entry & Firebase init
├── login.dart # Phone auth logic
├── upload_documents.dart # KYC upload UI & logic
├── verification_pending.dart # Awaiting approval screen
├── dashboard.dart # Post-verification home
├── edit_profile.dart # Profile info management
├── leave_request.dart # Leave form submission
├── contact_support.dart # Support & contact info
├── policy_pages.dart # Privacy and Terms display
└── utils/ # Constants and error handling

yaml
Copy
Edit

---

## 🔐 Firestore Security Rules (Example)

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /DeliveryPartners/{uid}/{document=**} {
      allow read, write: if request.auth != null && request.auth.uid == uid;
    }
  }
}
🛠️ Installation & Setup
✅ Prerequisites
Flutter SDK (latest stable)

Firebase project with:

Phone Authentication

Firestore

Cloud Storage

⚙️ Setup Steps
bash
Copy
Edit
git clone https://github.com/your-username/yaammy_delivery_partner.git
cd yaammy_delivery_partner
flutter pub get
Add your Firebase configuration files:

google-services.json → android/app/

GoogleService-Info.plist → ios/Runner/

▶️ Run the App
bash
Copy
Edit
flutter run
📈 Roadmap & Future Enhancements
📍 Live delivery tracking & route optimization

💰 Earnings dashboard with tips & payouts

⭐ Ratings & reviews for performance

🧾 Admin-side approval workflows

🔔 Push notifications using FCM

🤝 Contribution Guidelines
We welcome contributions from the community!

bash
Copy
Edit
# Fork the repository
git checkout -b feature/your-feature-name

# Make changes and commit
git commit -m "Added new feature"

# Push to your fork
git push origin feature/your-feature-name
Submit a pull request with a clear explanation and we’ll review it promptly.

📄 License
This project is licensed under the MIT License.
See the LICENSE file for full details.

📬 Contact
📧 Email: yaammyfood@gmail.com

📞 Phone: +91 84360 89071

Let me know if you'd like me to generate similar README.md files for:

🛒 Grocery App

🍽️ Restaurant App

👤 Customer App

🧑‍💻 Admin Panel Web App

csharp
Copy
Edit
