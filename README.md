# Delivery-Partner-App
The Yaammy Delivery Partner App is a feature-rich, mobile solution built using Flutter and Firebase, designed specifically for individuals looking to earn by delivering food, groceries, and more. The app empowers partners with tools to manage their profile, upload verification documents, and track their orders.


🎯 Purpose
To provide delivery agents with a seamless onboarding and management experience, enabling them to:

Register quickly and securely

Upload necessary KYC and vehicle documents

View their delivery status and history

Manage personal details and availability

Get support and stay updated on policies

📦 Core Features
✅ Document Verification
Upload Aadhaar, PAN, Passbook, License, RC, and Insurance images

Replace or remove uploads with a clean UI

Automatic check to ensure all documents are submitted before moving forward

👤 Partner Profile Management
View profile, vehicle info, and verification status

Update personal details (Edit Profile functionality)

Secure logout

📆 Leave Requests & Support
Submit leave requests through the app

Contact support easily via in-app options

Access Privacy Policy and Terms & Conditions

🔄 Dynamic Workflow
After document upload, navigates to Verification Pending

Auto-redirects to dashboard after approval timeout

Future-ready for live order tracking and route assignment

🧱 Tech Stack
Frontend: Flutter (Dart)

Backend: Firebase (Auth, Firestore, Storage – optional)

Media: image_picker for document uploads

Navigation: MaterialRoute and pushReplacement for flows

🛠 Installation
bash
Copy
Edit
git clone https://github.com/your-username/yaammy_delivery_partner.git
cd yaammy_delivery_partner
flutter pub get
flutter run
Add your google-services.json file and configure Firebase settings before running.

💡 Future Enhancements
Live delivery tracking and task notifications

Integrated payment dashboard for earnings and tips

Ratings, reviews, and performance stats

Admin approval system for documents

