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
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text('Help Center'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ---------- Quick Actions ----------
            _GroupCard(
              children: [
                _SettingTile(
                  icon: Icons.bug_report_outlined,
                  title: 'Report a Bug',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _openFeedbackDialog(context, preset: '[BUG] '),
                ),
                const _TileDivider(),
                _SettingTile(
                  icon: Icons.lightbulb_outline,
                  title: 'Send a Suggestion',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _openFeedbackDialog(context, preset: '[SUGGESTION] '),
                ),
                const _TileDivider(),
                _SettingTile(
                  icon: Icons.history,
                  title: 'View Command Logs (Device)',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: นำทางไปหน้าดู Log ของอุปกรณ์ หากคุณทำไว้
                    _toast(context, 'เปิดหน้าดู Log ของอุปกรณ์...');
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- FAQs ----------
            _GroupCard(
              children: const [
                _FaqTile(
                  question: 'เชื่อมต่ออุปกรณ์ (ESP32) ยังไงให้เสถียร?',
                  answerBullets: [
                    'เชื่อมต่อ Wi-Fi 2.4GHz และตั้งค่า SSID/รหัสผ่านให้ถูกต้อง',
                    'ตั้งค่า Static IP (ถ้าจำเป็น) หรือจด DHCP lease ให้คงที่ที่เราเตอร์',
                    'อัปเดตเฟิร์มแวร์ ESP32 และแอปให้เป็นเวอร์ชันล่าสุด',
                  ],
                ),
                _TileDivider(),
                _FaqTile(
                  question: 'ทำไมสั่งงานแล้วหลอดไฟไม่ตอบสนอง?',
                  answerBullets: [
                    'ตรวจสอบว่าอุปกรณ์ออนไลน์ (Ping IP ได้) และสายไฟ/รีเลย์ต่อถูกต้อง',
                    'ดู Log ว่ามีคำสั่งถึงอุปกรณ์หรือไม่',
                    'ลองรีสตาร์ทอุปกรณ์ และตรวจว่า Topic/Endpoint ตรงกับที่แอปตั้งค่า',
                  ],
                ),
                _TileDivider(),
                _FaqTile(
                  question: 'จะแชร์สิทธิ์ให้คนในบ้านควบคุมได้อย่างไร?',
                  answerBullets: [
                    'สร้างบัญชีผู้ใช้/สมาชิกในบ้านในหน้า Accounts (ถ้ามีระบบ)',
                    'ให้สิทธิ์เฉพาะอุปกรณ์ที่ต้องการ และถอนสิทธิ์ได้ทุกเมื่อ',
                    'ตั้งรหัสผ่านที่รัดกุมและเปิดการยืนยันหลายชั้น (ถ้ามี)',
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- Troubleshooting ----------
            _GroupCard(
              children: const [
                _TroubleshootTile(
                  title: 'การตั้งค่าเครือข่ายเบื้องต้น',
                  steps: [
                    'ใช้เราเตอร์ 2.4GHz (ESP32 มักไม่รองรับ 5GHz สำหรับโหมดทั่วไป)',
                    'ปิด AP Isolation / Client Isolation ในเราเตอร์',
                    'สงวน DHCP หรือกำหนด Static IP ให้ ESP32 เพื่อลดปัญหาหลุด',
                    'เปิดพอร์ต/ไฟร์วอลล์ตามที่ระบบต้องใช้ (ถ้ามี MQTT/HTTP/WS)',
                  ],
                ),
                _TileDivider(),
                _TroubleshootTile(
                  title: 'การจับคู่และค้นหาอุปกรณ์',
                  steps: [
                    'ตรวจว่า ESP32 อยู่ในโหมด Pairing/Provisioning',
                    'สแกนเครือข่ายภายในบ้านเพื่อตรวจพบอุปกรณ์',
                    'ตรวจชื่ออุปกรณ์/Chip ID และผูกกับบัญชีให้ถูกต้อง',
                  ],
                ),
                _TileDivider(),
                _TroubleshootTile(
                  title: 'ความปลอดภัย',
                  steps: [
                    'อัปเดตเฟิร์มแวร์และรหัสผ่านเราเตอร์/แอปอย่างสม่ำเสมอ',
                    'เปิดการเข้ารหัสการสื่อสาร (เช่น HTTPS/MQTT over TLS หากรองรับ)',
                    'จำกัดสิทธิ์ผู้ใช้ตามความจำเป็น (หลักการ Least Privilege)',
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- Contact ----------
            _GroupCard(
              children: [
                _SettingTile(
                  icon: Icons.email_outlined,
                  title: 'Contact Support (Email)',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // ถ้าจะเปิดเมลจริง แนะนำใช้ url_launcher
                    _toast(context, 'ติดต่อ: support@example.com');
                  },
                ),
                const _TileDivider(),
                _SettingTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  trailing: const Icon(Icons.chevron_right),
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
                  title: 'Terms of Service',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TermsOfServicePage())
                    );
                  },
                ),
              ],
            ),
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
          title: const Text('Send Feedback'),
          content: TextField(
            controller: _feedbackCtrl,
            maxLines: 6,
            decoration: const InputDecoration(
              hintText: 'อธิบายปัญหาหรือข้อเสนอแนะของคุณ...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final msg = _feedbackCtrl.text.trim();
                Navigator.pop(context);
                if (msg.isEmpty) {
                  _toast(context, 'กรุณาระบุข้อความ');
                  return;
                }
                // TODO: ส่งข้อความไปเซิร์ฟเวอร์/อีเมลของคุณ
                _toast(context, 'ส่ง Feedback แล้ว ขอบคุณครับ!');
              },
              child: const Text('Send'),
            ),
          ],
        );
      },
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
      ),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(children: children),
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
    return const Padding(
      padding: EdgeInsets.only(left: 46),
      child: Divider(height: 1, thickness: 1),
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
        tilePadding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: const Icon(Icons.help_outline),
        title: Text(
          question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        children: [
          for (final a in answerBullets)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  ', style: TextStyle(fontSize: 14)),
                Expanded(child: Text(a, style: const TextStyle(fontSize: 14, height: 1.4))),
              ],
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
      tilePadding: const EdgeInsets.symmetric(horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: const Icon(Icons.build_outlined),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      children: [
        for (final s in steps)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('•  ', style: TextStyle(fontSize: 14)),
              Expanded(child: Text(s, style: const TextStyle(fontSize: 14, height: 1.4))),
            ],
          ),
      ],
    );
  }
}

/// ---------- Helpers (logic/UI feedback) ----------

void _toast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg)),
  );
}