import 'package:flutter/material.dart';
import 'package:flutter_application/SmartHomeNaja/Page/Appbar.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Accounts.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Bugs.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Help_Center.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Lang.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Privacy_Policy.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/Terms_of_Service.dart';
import 'package:flutter_application/SmartHomeNaja/Page/SettingPage/wifi.dart';

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
      backgroundColor: Colors.grey[50],
      appBar: settingsAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Profile card ----------
            _GroupCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 28,
                        color: Colors.blueAccent,
                      ),
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
            ),

            const SizedBox(height: 20),
            const _SectionHeader('General'),
            const SizedBox(height: 8),

            // ---------- Group 1 ----------
            _GroupCard(
              child: Column(
                children: [
                  _SettingTile(
                    icon: Icons.notifications_none,
                    iconColor: Colors.orange,
                    iconBgColor: Colors.orange[50]!,
                    title: 'Notification',
                    trailing: SwitchTheme(
                      data: SwitchThemeData(
                        trackColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.orange;
                          }
                          return Colors.grey[300];
                        }),
                        thumbColor: MaterialStateProperty.all(Colors.white),
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
                  _TileDivider(),
                  _SettingTile(
                    icon: Icons.wifi,
                    iconColor: Colors.blue,
                    iconBgColor: Colors.blue[50]!,
                    title: 'WiFi',
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const WifiPage()),
                      );
                    },
                  ),
                  _TileDivider(),
                  _SettingTile(
                    icon: Icons.person_outline,
                    iconColor: Colors.purple,
                    iconBgColor: Colors.purple[50]!,
                    title: 'Accounts',
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AccountsPage()),
                      );
                    },
                  ),
                  _TileDivider(),
                  _SettingTile(
                    icon: Icons.language_outlined,
                    iconColor: Colors.green,
                    iconBgColor: Colors.green[50]!,
                    title: 'Languages',
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LanguagesPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ---------- Group 2 (Bugs / Help Center) ----------
            _GroupCard(
              child: Column(
                children: [
                  _SettingTile(
                    icon: Icons.bug_report_outlined,
                    iconColor: Colors.red,
                    iconBgColor: Colors.red[50]!,
                    title: 'Bugs and Suggestions',
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
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
                    iconColor: Colors.teal,
                    iconBgColor: Colors.teal[50]!,
                    title: 'Help Center',
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HelpCenterPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const _SectionHeader('More Information'),
            const SizedBox(height: 8),

            _GroupCard(
              child: Column(
                children: [
                  _SettingTile(
                    icon: Icons.policy_outlined,
                    iconColor: Colors.indigo,
                    iconBgColor: Colors.indigo[50]!,
                    title: 'Privacy Policy',
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
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
                    iconColor: Colors.amber[700]!,
                    iconBgColor: Colors.amber[50]!,
                    title: 'Terms of Service',
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
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
            ),

            const SizedBox(height: 16),

            // ---------- Logout ----------
            _GroupCard(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.red[700]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _confirmLogout(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.power_settings_new,
                            size: 24,
                            color: Colors.white,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Icon(Icons.chevron_right, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.power_settings_new, color: Colors.redAccent),
            const SizedBox(width: 8),
            const Text('Logout'),
          ],
        ),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              _toast(context, 'Logged out successfully');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

// ---------- Helper Widgets ----------

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.blue[900],
        ),
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.child});
  final Widget child;

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
      child: child,
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.icon,
    required this.title,
    this.iconColor,
    this.iconBgColor,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Color? iconColor;
  final Color? iconBgColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconBgColor ?? Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor ?? Colors.blueAccent,
                ),
              ),
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
      ),
    );
  }
}

class _TileDivider extends StatelessWidget {
  const _TileDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64),
      child: Divider(height: 1, thickness: 1, color: Colors.grey[200]),
    );
  }
}

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
