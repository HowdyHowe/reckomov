import 'package:flutter/material.dart';
import 'package:reckomov_app/components/appbar/appbar.dart';

class AccountPrivacyPolice extends StatelessWidget {
  const AccountPrivacyPolice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ResAppbar(),
        body: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Color.fromARGB(255, 46, 54, 72),
            child: ListView(
              children: [
                Center(
                    child: Text(
                  "PRIVACY POLICE",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '''Privacy Policy

Effective Date: 1 August 2025

1. Introduction
Welcome to MyApp. Your privacy is important to us, and we are committed to protecting your personal information. This Privacy Policy explains how we collect, use, and safeguard your information when you use our movie recommendation app.

2. Information We Collect
We may collect the following types of information:

- Personal Information:
  - Name, email address, or other contact information when you create an account.
  - Payment details (if applicable for premium features).

- Non-Personal Information:
  - Device information (e.g., type, operating system, and app version).
  - Usage data (e.g., app interactions, search queries, and preferences).

- Location Information:
  - Approximate location data to provide localized recommendations (if you grant permission).

3. How We Use Your Information
We use the information we collect for the following purposes:

- To provide and improve the App’s functionality.
- To personalize movie recommendations based on your preferences.
- To send notifications, updates, or promotional offers.
- To analyze usage trends and improve the App’s performance.
- To ensure the security and integrity of our services.

4. Sharing Your Information
We do not sell your personal information. However, we may share information with third parties in the following situations:

- Service Providers:
  - To perform functions such as hosting, data analysis, and customer service.

- Legal Obligations:
  - When required by law or to protect our rights and comply with legal processes.

- Business Transfers:
  - In the event of a merger, acquisition, or sale of assets, your information may be transferred to the new entity.

5. Data Retention
We retain your information as long as necessary to fulfill the purposes outlined in this Privacy Policy or as required by law. You may request the deletion of your account and associated data by contacting us at myemail@gmail.com.

6. Security
We implement reasonable measures to protect your information from unauthorized access, alteration, or destruction. However, no method of transmission or storage is 100% secure.

7. Your Rights
Depending on your location, you may have certain rights regarding your personal information, including:

- Accessing your data.
- Updating or correcting your information.
- Deleting your data.
- Opting out of targeted advertising or data processing.

To exercise these rights, please contact us at myemail@gmail.com.

8. Third-Party Links
The App may contain links to third-party websites or services. We are not responsible for the privacy practices of these external platforms.

9. Children’s Privacy
The App is not intended for children under 13 years of age, and we do not knowingly collect personal information from them. If we become aware of such data, we will delete it promptly.

10. Changes to This Privacy Policy
We may update this Privacy Policy from time to time. We encourage you to review it periodically. Your continued use of the App after changes are made constitutes your acceptance of the updated Privacy Policy.

11. Contact Us
If you have any questions or concerns about this Privacy Policy, please contact us at:

MyApp
Somewhere, this country
Email: myemail@gmail.com
Phone: +62 8123 4567 890
''',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
