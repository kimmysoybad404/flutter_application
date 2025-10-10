import 'package:flutter/material.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Privacy_Policy.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Terms_of_Service.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  final _feedbackCtrl = TextEditingController();

  @override
  void dispose() {
    _feedbackCtrl.dispose();
    super.dispose();
  }

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
          'Help Center',
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
                Icons.help_center,
                size: 48,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 24),

            // ---------- Quick Actions ----------
            _SectionHeader(
              icon: Icons.flash_on,
              title: 'Quick Actions',
            ),
            const SizedBox(height: 12),
            _GroupCard(
              children: [
                _SettingTile(
                  icon: Icons.bug_report_outlined,
                  iconColor: Colors.red[400],
                  title: 'Report a Bug',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
                  onTap: () => _openFeedbackDialog(context, preset: '[BUG] '),
                ),
                const _TileDivider(),
                _SettingTile(
                  icon: Icons.lightbulb_outline,
                  iconColor: Colors.amber[600],
                  title: 'Send a Suggestion',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
                  onTap: () => _openFeedbackDialog(context, preset: '[SUGGESTION] '),
                ),
                const _TileDivider(),
                _SettingTile(
                  icon: Icons.history,
                  iconColor: Colors.blue[400],
                  title: 'View Command Logs (Device)',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
                  onTap: () {
                    _toast(context, 'Opening device logs...');
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ---------- FAQs ----------
            _SectionHeader(
              icon: Icons.quiz,
              title: 'Frequently Asked Questions',
            ),
            const SizedBox(height: 12),
            _GroupCard(
              children: const [
                _FaqTile(
                  question: 'How to connect ESP32 device stably?',
                  answerBullets: [
                    'Connect to 2.4GHz Wi-Fi and set SSID/password correctly',
                    'Configure Static IP (if necessary) or reserve DHCP lease at router',
                    'Update ESP32 firmware and app to the latest version',
                  ],
                ),
                _TileDivider(),
                _FaqTile(
                  question: 'Why doesn\'t the light respond to commands?',
                  answerBullets: [
                    'Check if device is online (can ping IP) and wiring/relay is correct',
                    'Check logs to see if command reached the device',
                    'Try restarting the device and verify Topic/Endpoint matches app settings',
                  ],
                ),
                _TileDivider(),
                _FaqTile(
                  question: 'How to share control with family members?',
                  answerBullets: [
                    'Create user accounts/home members in Accounts page (if available)',
                    'Grant permissions for specific devices only and revoke anytime',
                    'Set strong passwords and enable multi-factor authentication (if available)',
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ---------- Troubleshooting ----------
            _SectionHeader(
              icon: Icons.build,
              title: 'Troubleshooting',
            ),
            const SizedBox(height: 12),
            _GroupCard(
              children: const [
                _TroubleshootTile(
                  title: 'Basic Network Setup',
                  steps: [
                    'Use 2.4GHz router (ESP32 typically doesn\'t support 5GHz in standard mode)',
                    'Disable AP Isolation / Client Isolation in router',
                    'Reserve DHCP or assign Static IP to ESP32 to reduce disconnection issues',
                    'Open ports/firewall as required by system (if using MQTT/HTTP/WS)',
                  ],
                ),
                _TileDivider(),
                _TroubleshootTile(
                  title: 'Pairing and Device Discovery',
                  steps: [
                    'Verify ESP32 is in Pairing/Provisioning mode',
                    'Scan home network to detect devices',
                    'Check device name/Chip ID and bind to account correctly',
                  ],
                ),
                _TileDivider(),
                _TroubleshootTile(
                  title: 'Security',
                  steps: [
                    'Regularly update firmware and router/app passwords',
                    'Enable encrypted communication (e.g., HTTPS/MQTT over TLS if supported)',
                    'Limit user permissions as necessary (Least Privilege principle)',
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ---------- Contact & Legal ----------
            _SectionHeader(
              icon: Icons.contact_support,
              title: 'Contact & Legal',
            ),
            const SizedBox(height: 12),
            _GroupCard(
              children: [
                _SettingTile(
                  icon: Icons.email_outlined,
                  iconColor: Colors.green[400],
                  title: 'Contact Support (Email)',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
                  onTap: () {
                    _toast(context, 'Contact: support@example.com');
                  },
                ),
                const _TileDivider(),
                _SettingTile(
                  icon: Icons.privacy_tip_outlined,
                  iconColor: Colors.purple[400],
                  title: 'Privacy Policy',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PrivacyPolicyPage())
                    );
                  },
                ),
                const _TileDivider(),
                _SettingTile(
                  icon: Icons.description_outlined,
                  iconColor: Colors.orange[400],
                  title: 'Terms of Service',
                  trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TermsOfServicePage())
                    );
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _openFeedbackDialog(BuildContext context, {String preset = ''}) {
    _feedbackCtrl.text = preset;
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.feedback, color: Colors.blue[600]),
              const SizedBox(width: 8),
              const Text('Send Feedback'),
            ],
          ),
          content: TextField(
            controller: _feedbackCtrl,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Describe your issue or suggestion...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue[400]!, width: 2),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
            ),
            ElevatedButton(
              onPressed: () {
                final msg = _feedbackCtrl.text.trim();
                Navigator.pop(context);
                if (msg.isEmpty) {
                  _toast(context, 'Please enter a message', isError: true);
                  return;
                }
                _toast(context, 'Feedback sent. Thank you!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }
}

/// ---------- Section Header ----------
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blue[700]),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.blue[900],
          ),
        ),
      ],
    );
  }
}

/// ---------- Helpers (UI) ----------
class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(children: children),
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.icon,
    required this.title,
    this.iconColor,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Color? iconColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22, color: iconColor ?? Colors.grey[700]),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

class _TileDivider extends StatelessWidget {
  const _TileDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Divider(height: 1, thickness: 1, color: Colors.grey[200]),
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({
    required this.question,
    required this.answerBullets,
  });

  final String question;
  final List<String> answerBullets;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(Icons.help_outline, color: Colors.blue[400]),
        title: Text(
          question,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        children: [
          for (final a in answerBullets)
            Padding(
              padding: const EdgeInsets.only(bottom: 6, left: 36),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      a,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _TroubleshootTile extends StatelessWidget {
  const _TroubleshootTile({
    required this.title,
    required this.steps,
  });

  final String title;
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(Icons.build_outlined, color: Colors.orange[400]),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      children: [
        for (final s in steps)
          Padding(
            padding: const EdgeInsets.only(bottom: 6, left: 36),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    s,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// ---------- Helpers (logic/UI feedback) ----------
void _toast(BuildContext context, String msg, {bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(msg)),
        ],
      ),
      backgroundColor: isError ? Colors.red[700] : Colors.green[700],
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(16),
    ),
  );
}