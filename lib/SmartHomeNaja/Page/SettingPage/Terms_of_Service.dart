import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

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
          'Terms of Service',
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
                Icons.description,
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
              child: const _TermsBody(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _TermsBody extends StatelessWidget {
  const _TermsBody();

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
          'Terms & Conditions',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Please read these terms carefully before using the app',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),

        h('1) General Agreement'),
        p('By using this application, you accept all the terms below. '
            'The app is used to control electrical devices in your home (e.g., lights, smart plugs) via ESP32.'),

        h('2) Safety and User Responsibility'),
        li('Maintain security of your account, password, and home network'),
        li('Install/wire according to electrical standards to prevent fire/short circuits'),
        li('Do not use in risky conditions such as wet or abnormally high temperatures'),

        h('3) Device Connection (ESP32)'),
        li('Devices must be on a network you are responsible for'),
        li('Update firmware/software regularly for security'),
        li('Only allow trusted users to control devices'),

        h('4) Privacy and Data'),
        li('May collect command logs/device data to improve services'),
        li('Will not sell personal data to third parties'),
        li('Contact us to request deletion/copy of your data'),

        h('5) Prohibited Use'),
        li('Do not use illegally, disturb others, or access devices you have no right to'),
        li('Do not hack systems/intercept data/reverse engineer'),

        h('6) Warranty and Limitation of Liability'),
        li('Software is provided "as is". Developers are not responsible for damages from '
            'improper use, incorrect electrical installation, or network/hardware issues'),
        li('Should have fire protection devices (fuse/breaker) according to standards'),

        h('7) Terms Updates'),
        p('We may update these terms periodically. If there are significant changes, '
            'we will notify you in the app'),

        h('8) Termination of Use'),
        p('We may suspend accounts that violate terms or pose security risks'),

        h('9) Contact'),
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
                'Last updated: 01/10/2025',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Agree Button
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
                  'I Agree',
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