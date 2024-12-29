import 'package:flutter/material.dart';
import 'package:reckomov_app/components/appbar/appbar.dart';

class AccountTermsofService extends StatelessWidget {
  const AccountTermsofService({super.key});

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
                  "TERMS OF SERVICE",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '''Terms of Service

Effective Date: 1 March 2024

1. Acceptance of Terms
By downloading, accessing, or using MyApp, you agree to be bound by these Terms of Service ("Terms"). If you do not agree to these Terms, you may not use the App.

2. Use of the App
- Eligibility:
  - You must be at least 13 years old to use the App.
  - If you are under the age of majority in your jurisdiction, you must have the consent of a parent or guardian.

- License:
  - We grant you a limited, non-exclusive, non-transferable, and revocable license to use the App solely for personal, non-commercial purposes.

- Prohibited Activities:
  - Reverse engineering, modifying, or creating derivative works of the App.
  - Using the App for illegal, harmful, or unauthorized purposes.
  - Interfering with the operation of the App or attempting to gain unauthorized access to its systems.

3. User Accounts
- You are responsible for maintaining the confidentiality of your account credentials.
- You agree to provide accurate and up-to-date information when creating your account.
- We reserve the right to suspend or terminate your account if you violate these Terms.

4. Content
- User-Generated Content:
  - You retain ownership of any content you upload or submit to the App.
  - By submitting content, you grant us a worldwide, royalty-free, and sublicensable license to use, modify, and distribute your content for the operation of the App.

- Third-Party Content:
  - The App may include links or integrations to third-party services. We are not responsible for the content or practices of these services.

- Intellectual Property:
  - All intellectual property rights in the App, including trademarks, logos, and software, are owned by [Your Company Name].

5. Subscriptions and Payments
- Some features of the App may require payment or subscription.
- Payment terms, including pricing and billing frequency, will be disclosed before purchase.
- You agree to pay all fees and applicable taxes associated with your use of the paid features.
- Refunds are subject to our rule.

6. Limitation of Liability
- To the extent permitted by law, [Your Company Name] is not liable for any indirect, incidental, or consequential damages arising from your use of the App.
- We do not guarantee the accuracy, completeness, or reliability of the content provided in the App.

7. Indemnification
You agree to indemnify and hold [Your Company Name], its affiliates, and employees harmless from any claims, damages, or expenses arising out of your use of the App or violation of these Terms.

8. Termination
- We may suspend or terminate your access to the App at any time for any reason, including violation of these Terms.
- Upon termination, your rights to use the App will cease immediately.

9. Changes to These Terms
We reserve the right to update or modify these Terms at any time. We will notify you of any material changes by updating the "Effective Date" or through other communication methods. Continued use of the App after changes indicates your acceptance of the new Terms.

10. Governing Law
These Terms are governed by the laws of [Insert Jurisdiction]. Any disputes arising from these Terms or the App will be subject to the exclusive jurisdiction of the courts in [Insert Location].

11. Contact Information
If you have any questions or concerns about these Terms, please contact us at:

MyApp
somewhere, this country
Email: myemail@gmail.com
Phone: +62 812 3456 7890
''',
                    style: TextStyle(
                      fontSize: 12,
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
