import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  // Profile
  final _nameCtrl = TextEditingController(text: 'Mr. A Student');
  final _emailCtrl = TextEditingController(text: 'user@example.com');

  // Change Password
  final _pwFormKey = GlobalKey<FormState>();
  final _currentPwCtrl = TextEditingController();
  final _newPwCtrl = TextEditingController();
  final _confirmPwCtrl = TextEditingController();
  bool _showCurrent = false;
  bool _showNew = false;
  bool _showConfirm = false;

  // Home Members
  final List<_Member> _members = [
    _Member(name: 'Dad', email: 'dad@example.com', role: 'Admin'),
    _Member(name: 'Sibling', email: 'bro@example.com', role: 'Member'),
  ];

  // Active Sessions
  final List<_Session> _sessions = [
    _Session(device: 'Android Phone', location: 'Bangkok, TH', lastActive: 'Now'),
    _Session(device: 'Windows PC', location: 'Chiang Rai, TH', lastActive: '2h ago'),
  ];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _currentPwCtrl.dispose();
    _newPwCtrl.dispose();
    _confirmPwCtrl.dispose();
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
          'Account Settings',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header Icon & Profile
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_circle,
                size: 48,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 24),

            // ---------- Profile ----------
            _GroupCard(
              child: Column(
                children: [
                  _SectionHeader(icon: Icons.person, title: 'Profile'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.blue[100],
                              child: Icon(Icons.person, size: 50, color: Colors.blue[700]),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                                  onPressed: () => _toast(context, 'Change photo feature'),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _LabeledField(
                          label: 'Name',
                          icon: Icons.person_outline,
                          child: TextField(
                            controller: _nameCtrl,
                            decoration: _inputDecoration(hintText: 'Enter your name'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _LabeledField(
                          label: 'Email',
                          icon: Icons.email_outlined,
                          child: TextField(
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            decoration: _inputDecoration(hintText: 'Enter your email'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _saveProfile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[600],
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Save Profile',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------- Security ----------
            _GroupCard(
              child: Column(
                children: [
                  _SectionHeader(icon: Icons.lock, title: 'Security'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: Form(
                      key: _pwFormKey,
                      child: Column(
                        children: [
                          _LabeledField(
                            label: 'Current Password',
                            icon: Icons.lock_outline,
                            child: TextFormField(
                              controller: _currentPwCtrl,
                              obscureText: !_showCurrent,
                              decoration: _inputDecoration(
                                hintText: 'Enter current password',
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() => _showCurrent = !_showCurrent),
                                  icon: Icon(_showCurrent ? Icons.visibility_off : Icons.visibility),
                                ),
                              ),
                              validator: _notEmpty,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _LabeledField(
                            label: 'New Password',
                            icon: Icons.lock_clock,
                            child: TextFormField(
                              controller: _newPwCtrl,
                              obscureText: !_showNew,
                              decoration: _inputDecoration(
                                hintText: 'Enter new password',
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() => _showNew = !_showNew),
                                  icon: Icon(_showNew ? Icons.visibility_off : Icons.visibility),
                                ),
                              ),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty) return 'Please enter new password';
                                if (v.length < 8) return 'Password must be at least 8 characters';
                                if (v == _currentPwCtrl.text) return 'New password must be different';
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          _LabeledField(
                            label: 'Confirm New Password',
                            icon: Icons.lock_reset,
                            child: TextFormField(
                              controller: _confirmPwCtrl,
                              obscureText: !_showConfirm,
                              decoration: _inputDecoration(
                                hintText: 'Confirm new password',
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() => _showConfirm = !_showConfirm),
                                  icon: Icon(_showConfirm ? Icons.visibility_off : Icons.visibility),
                                ),
                              ),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty) return 'Please confirm password';
                                if (v != _newPwCtrl.text) return 'Passwords do not match';
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: _changePassword,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Change Password',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------- Home Members ----------
            _GroupCard(
              child: Column(
                children: [
                  _SectionHeader(icon: Icons.group, title: 'Home Members'),
                  for (int i = 0; i < _members.length; i++) ...[
                    _MemberTile(
                      member: _members[i],
                      onRemove: () => _removeMember(i),
                    ),
                    if (i != _members.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(left: 72),
                        child: Divider(height: 1, color: Colors.grey[200]),
                      ),
                  ],
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: _addMemberDialog,
                        icon: const Icon(Icons.person_add_alt_1),
                        label: const Text('Add Member'),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue[300]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------- Active Sessions ----------
            _GroupCard(
              child: Column(
                children: [
                  _SectionHeader(icon: Icons.devices, title: 'Active Sessions'),
                  for (int i = 0; i < _sessions.length; i++) ...[
                    _SessionTile(session: _sessions[i]),
                    if (i != _sessions.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(left: 72),
                        child: Divider(height: 1, color: Colors.grey[200]),
                      ),
                  ],
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: _signOutOthers,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.orange[300]!),
                          foregroundColor: Colors.orange[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Sign out on other devices'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------- Danger Zone ----------
            _GroupCard(
              child: Column(
                children: [
                  _SectionHeader(
                    icon: Icons.warning_amber,
                    title: 'Danger Zone',
                    iconColor: Colors.red[600],
                    titleColor: Colors.red[700],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[600],
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _confirmDeleteAccount,
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({String? hintText, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[400]),
      filled: true,
      fillColor: Colors.grey[50],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[200]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.blue[400]!, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      suffixIcon: suffixIcon,
    );
  }

  // Actions
  void _saveProfile() {
    _toast(context, 'Profile saved successfully');
  }

  void _changePassword() {
    if (!_pwFormKey.currentState!.validate()) return;
    _toast(context, 'Password changed successfully');
    _currentPwCtrl.clear();
    _newPwCtrl.clear();
    _confirmPwCtrl.clear();
  }

  void _addMemberDialog() {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    String role = 'Member';

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.person_add, color: Colors.blue[600]),
              const SizedBox(width: 8),
              const Text('Add Member'),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: _inputDecoration(hintText: 'Name'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: role,
                  decoration: _inputDecoration(),
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'Member', child: Text('Member')),
                  ],
                  onChanged: (v) => setDialogState(() => role = v ?? 'Member'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.trim().isEmpty || emailCtrl.text.trim().isEmpty) {
                  _toast(context, 'Please fill in all fields', isError: true);
                  return;
                }
                setState(() {
                  _members.add(_Member(
                    name: nameCtrl.text.trim(),
                    email: emailCtrl.text.trim(),
                    role: role,
                  ));
                });
                Navigator.pop(context);
                _toast(context, 'Member added successfully');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _removeMember(int index) {
    final m = _members[index];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Remove Member'),
        content: Text('Remove ${m.name} from home members?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _members.removeAt(index));
              Navigator.pop(context);
              _toast(context, 'Member removed');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[600],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  void _signOutOthers() {
    _toast(context, 'Signed out from other devices');
  }

  void _confirmDeleteAccount() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.warning_amber, color: Colors.red[600]),
            const SizedBox(width: 8),
            const Text('Delete Account'),
          ],
        ),
        content: const Text(
          'Deleting your account will remove all user data, settings, and device connections. This action cannot be undone. Are you sure?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[600],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.pop(context);
              _toast(context, 'Account deleted');
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  String? _notEmpty(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Please fill in this field' : null;
}

// Models
class _Member {
  final String name, email, role;
  _Member({required this.name, required this.email, required this.role});
}

class _Session {
  final String device, location, lastActive;
  _Session({required this.device, required this.location, required this.lastActive});
}

// Reusable UI
class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
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

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.title,
    this.iconColor,
    this.titleColor,
  });

  final IconData icon;
  final String title;
  final Color? iconColor, titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: iconColor ?? Colors.blue[700]),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: titleColor ?? Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.icon,
    required this.child,
  });

  final String label;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: Colors.grey[700]),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.member, required this.onRemove});
  final _Member member;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person, size: 20, color: Colors.blue[700]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  '${member.email} • ${member.role}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: Icon(Icons.delete_outline, color: Colors.red[400]),
          ),
        ],
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.session});
  final _Session session;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green[50],
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.devices, size: 20, color: Colors.green[700]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(session.device, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  '${session.location} • ${session.lastActive}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
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