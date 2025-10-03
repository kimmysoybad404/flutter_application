import 'package:flutter/material.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Accounts.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Bugs.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Help_Center.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Lang.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Privacy_Policy.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Terms_of_Service.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  bool notifOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Setting",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Profile card ----------
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 26,
                    child: Icon(Icons.person, size: 28),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Mr.อยากได้ A',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            const _SectionHeader('General'),
            const SizedBox(height: 8),

            // ---------- Group 1 ----------
            _GroupCard(
              children: [
                _SettingTile(
                  icon: Icons.notifications_none,
                  title: 'Notification',
                  trailing: SwitchTheme(
                    data: SwitchThemeData(
                      trackColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        return const Color.fromARGB(255, 207, 207, 207);
                      }),
                      thumbColor: MaterialStateProperty.all(Colors.white),
                      trackOutlineColor: MaterialStateProperty.resolveWith((
                        states,
                      ) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blueAccent;
                        }
                        return const Color.fromARGB(255, 207, 207, 207);
                      }),
                    ),
                    child: Switch(
                      value: notifOn,
                      onChanged: (v) {
                        setState(() {
                          notifOn = v;
                        });
                      },
                    ),
                  ),

                  onTap: () => setState(() => notifOn = !notifOn),
                ),
                const _TileDivider(),
                _SettingTile(
                  icon: Icons.person_outline,
                  title: 'Accounts',
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AccountsPage()),
                    );
                  },
                ),
                const _TileDivider(),
                _SettingTile(
                  icon: Icons.language_outlined,
                  title: 'Languages',
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LanguagesPage()),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- Group 2 (Bugs / Help Center) ----------
            _GroupCard(
              children: [
                _SettingTile(
                  icon: Icons.bug_report_outlined,
                  title: 'Bugs and Suggestions',
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BugsAndSuggestionsPage(),
                      ),
                    );
                  },
                ),
                _TileDivider(),
                _SettingTile(
                  icon: Icons.headphones_outlined,
                  title: 'Help Center',
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HelpCenterPage()),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),
            const _SectionHeader('More Information'),
            const SizedBox(height: 8),

            _GroupCard(
              children: [
                _SettingTile(
                  icon: Icons.policy_outlined,
                  title: 'Privacy Policy',
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PrivacyPolicyPage(),
                      ),
                    );
                  },
                ),
                _TileDivider(),
                _SettingTile(
                  icon: Icons.description_outlined,
                  title: 'Terms of Service',
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TermsOfServicePage(),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- Logout (single card) ----------
            _GroupCardLogut(
              children: const [
                _SettingTileLogut(
                  icon: Icons.power_settings_new,
                  title: 'Logout',
                  trailing: Icon(Icons.chevron_right, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ----------------- Helper Widgets -----------------

/// หัวข้อส่วน (ตัวหนังสือเล็กด้านบนของกลุ่มการ์ด)
class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}

/// กล่องกลุ่มรายการ (พื้นหลังขาว มุมมน)
class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.children, super.key});
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

class _GroupCardLogut extends StatelessWidget {
  const _GroupCardLogut({required this.children, super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(children: children),
    );
  }
}

/// หนึ่งแถวของรายการตั้งค่า
class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    super.key,
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
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

class _SettingTileLogut extends StatelessWidget {
  const _SettingTileLogut({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    super.key,
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
            Icon(icon, size: 22, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

/// เส้นแบ่งระหว่างแถว (บางๆ มาขยับให้ไม่ชนไอคอน)
class _TileDivider extends StatelessWidget {
  const _TileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 46),
      child: Divider(height: 1, thickness: 1),
    );
  }
}
