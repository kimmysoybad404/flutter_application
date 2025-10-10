import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.privacy_tip,
                size: 48,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 24),
            
            // Content Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: const _PolicyBody(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _PolicyBody extends StatelessWidget {
  const _PolicyBody();

  @override
  Widget build(BuildContext context) {
    Widget h(String t) => Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  t,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ],
          ),
        );

    Widget p(String t) => Padding(
          padding: const EdgeInsets.only(bottom: 12, left: 12),
          child: Text(
            t,
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Colors.grey[800],
            ),
          ),
        );

    Widget li(String t) => Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  t,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Section
        const Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your privacy is important to us',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),

        h('Overview'),
        p('This privacy policy explains how the home electrical device control app '
            '(such as lights/smart plugs via ESP32) collects, uses, stores, and discloses data, '
            'as well as user rights regarding their data.'),

        h('Information We Collect'),
        li('Basic account information: username, email (if registration system exists)'),
        li('Device information: device name, unique device identifier (device ID, chip ID)'),
        li('Command logs: time, commands sent, response status for troubleshooting'),
        li('Aggregated usage analytics (non-personally identifiable) to improve experience'),

        h('Purpose of Data Use'),
        li('Provide device control/status monitoring services through the app correctly'),
        li('Improve service quality, fix bugs, and enhance security'),
        li('Communicate necessary notifications, such as device abnormalities'),

        h('Legal Basis (if applicable regulations exist)'),
        li('Service contract: to make the app and devices work as users expect'),
        li('Legitimate interest: for security and user experience'),
        li('Consent: for information/features requiring prior consent'),

        h('Data Disclosure'),
        li('We do not sell personal data to third parties'),
        li('May disclose to infrastructure service providers (e.g., hosting/notifications) '
            'only as necessary and under data protection agreements'),
        li('In case of legal requirements/court orders, we may be required to disclose as required by law'),

        h('Storage and Retention Period'),
        li('Store data only as necessary for service provision and stated purposes'),
        li('Delete portions/anonymize when no longer necessary'),

        h('Data Security'),
        li('Use appropriate security measures to prevent unauthorized access/use/modification/destruction of data'),
        li('Users should maintain security of their account, home network, and keep device firmware (ESP32) up to date'),

        h('User Rights'),
        li('Request access/obtain a copy of their personal data'),
        li('Request correction of inaccurate data'),
        li('Request deletion or object to certain processing (subject to legal conditions)'),
        li('Withdraw consent for processing based on consent'),

        h('Cookies/Tracking Technology (if applicable)'),
        li('If cookies or SDKs are used to track usage statistics, they will be used to improve services and will not identify individuals'),

        h('Third-Party Services'),
        li('If connected to third-party services (e.g., notification/cloud services), '
            'usage will also be subject to those providers\' policies'),

        h('Children and Youth'),
        li('This service is intended for adults/homeowners. Parents should supervise minors\' use'),

        h('Policy Changes'),
        p('We may update this policy periodically. If there are significant changes, '
            'we will notify you within the app.'),

        h('Contact'),
        p('Support email: 6631501xxx@lamduan.mfu.ac.th'),

        const SizedBox(height: 20),
        
        // Last Updated Info
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.update, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Text(
                'Last updated: 02/10/2025',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Close Button
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[600],
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, size: 20),
                SizedBox(width: 8),
                Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}