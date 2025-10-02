import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  // -------- Profile --------
  final _nameCtrl = TextEditingController(text: 'Mr. อยากได้ A');
  final _emailCtrl = TextEditingController(text: 'user@example.com');

  // -------- Change Password --------
  final _pwFormKey = GlobalKey<FormState>();
  final _currentPwCtrl = TextEditingController();
  final _newPwCtrl = TextEditingController();
  final _confirmPwCtrl = TextEditingController();
  bool _showCurrent = false;
  bool _showNew = false;
  bool _showConfirm = false;

  // -------- Home Members --------
  final List<_Member> _members = [
    _Member(name: 'คุณพ่อ', email: 'dad@example.com', role: 'Admin'),
    _Member(name: 'น้อง', email: 'bro@example.com', role: 'Member'),
  ];

  // -------- Active Sessions (Demo) --------
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
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text('Accounts'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ---------- Profile ----------
            _GroupCard(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 28, child: Icon(Icons.person, size: 28)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Profile',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          // TODO: เปิดเลือกไฟล์/กล้องเพื่อเปลี่ยนรูปโปรไฟล์
                          _toast(context, 'เปลี่ยนรูปโปรไฟล์ (ตัวอย่าง)');
                        },
                        icon: const Icon(Icons.photo_camera_outlined, size: 18),
                        label: const Text('Change Photo'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      _LabeledField(
                        label: 'Name',
                        child: TextField(
                          controller: _nameCtrl,
                          decoration: const InputDecoration(
                            hintText: 'กรอกชื่อ',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _LabeledField(
                        label: 'Email',
                        child: TextField(
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'กรอกอีเมล',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _saveProfile,
                          child: const Text('Save Profile'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- Security: Change Password ----------
            _GroupCard(
              children: [
                const _CardHeader(icon: Icons.lock_outline, title: 'Security'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Form(
                    key: _pwFormKey,
                    child: Column(
                      children: [
                        _LabeledField(
                          label: 'Current Password',
                          child: TextFormField(
                            controller: _currentPwCtrl,
                            obscureText: !_showCurrent,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () => setState(() => _showCurrent = !_showCurrent),
                                icon: Icon(_showCurrent ? Icons.visibility_off : Icons.visibility),
                              ),
                            ),
                            validator: _notEmpty,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _LabeledField(
                          label: 'New Password',
                          child: TextFormField(
                            controller: _newPwCtrl,
                            obscureText: !_showNew,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () => setState(() => _showNew = !_showNew),
                                icon: Icon(_showNew ? Icons.visibility_off : Icons.visibility),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) return 'กรุณากรอกรหัสใหม่';
                              if (v.length < 8) return 'รหัสผ่านอย่างน้อย 8 ตัวอักษร';
                              if (v == _currentPwCtrl.text) return 'รหัสใหม่ต้องต่างจากรหัสเดิม';
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        _LabeledField(
                          label: 'Confirm New Password',
                          child: TextFormField(
                            controller: _confirmPwCtrl,
                            obscureText: !_showConfirm,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () => setState(() => _showConfirm = !_showConfirm),
                                icon: Icon(_showConfirm ? Icons.visibility_off : Icons.visibility),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) return 'กรุณายืนยันรหัสใหม่';
                              if (v != _newPwCtrl.text) return 'รหัสยืนยันไม่ตรงกับรหัสใหม่';
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _changePassword,
                            child: const Text('Change Password'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- Home Members ----------
            _GroupCard(
              children: [
                const _CardHeader(icon: Icons.group_outlined, title: 'Home Members'),
                for (int i = 0; i < _members.length; i++) ...[
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: const CircleAvatar(child: Icon(Icons.person, size: 18)),
                    title: Text(_members[i].name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('${_members[i].email} • ${_members[i].role}'),
                    trailing: IconButton(
                      onPressed: () => _removeMember(i),
                      icon: const Icon(Icons.delete_outline),
                      tooltip: 'Remove',
                    ),
                  ),
                  if (i != _members.length - 1) const _TileDivider(),
                ],
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _addMemberDialog,
                      icon: const Icon(Icons.person_add_alt_1),
                      label: const Text('Add Member'),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- Active Sessions ----------
            _GroupCard(
              children: [
                const _CardHeader(icon: Icons.devices_other, title: 'Active Sessions'),
                for (int i = 0; i < _sessions.length; i++) ...[
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: const Icon(Icons.device_hub_outlined),
                    title: Text(_sessions[i].device),
                    subtitle: Text('${_sessions[i].location} • ${_sessions[i].lastActive}'),
                  ),
                  if (i != _sessions.length - 1) const _TileDivider(),
                ],
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _signOutOthers,
                      child: const Text('Sign out on other devices'),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 12),

            // ---------- Danger Zone ----------
            _GroupCard(
              children: [
                const _CardHeader(icon: Icons.warning_amber_outlined, title: 'Danger Zone'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade600,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _confirmDeleteAccount,
                      child: const Text('Delete Account'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ------- Actions -------

  void _saveProfile() {
    // TODO: ส่งข้อมูลไปอัปเดตโปรไฟล์ backend
    _toast(context, 'บันทึกโปรไฟล์แล้ว');
  }

  void _changePassword() {
    if (!_pwFormKey.currentState!.validate()) return;

    // TODO: ส่งคำขอเปลี่ยนรหัสผ่านไป backend
    _toast(context, 'เปลี่ยนรหัสผ่านสำเร็จ');
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
      builder: (_) {
        return AlertDialog(
          title: const Text('Add Member'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: role,
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'Member', child: Text('Member')),
                  ],
                  onChanged: (v) => role = v ?? 'Member',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.trim().isEmpty || emailCtrl.text.trim().isEmpty) {
                  _toast(context, 'กรอกชื่อและอีเมลให้ครบ');
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
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _removeMember(int index) {
    final m = _members[index];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Remove Member'),
        content: Text('ลบสมาชิก ${m.name}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() => _members.removeAt(index));
              Navigator.pop(context);
              _toast(context, 'ลบสมาชิกแล้ว');
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  void _signOutOthers() {
    // TODO: เรียก backend เพื่อล็อกเอาท์อุปกรณ์อื่น
    _toast(context, 'ลงชื่อออกจากอุปกรณ์อื่นแล้ว');
  }

  void _confirmDeleteAccount() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'การลบบัญชีจะลบข้อมูลผู้ใช้ การตั้งค่า และอาจลบการเชื่อมต่ออุปกรณ์ทั้งหมด '
          'ต้องการลบจริงหรือไม่?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
              // TODO: เรียก backend เพื่อลบบัญชี
              _toast(context, 'ลบบัญชีแล้ว');
              Navigator.pop(context); // ปิดหน้า Accounts
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  // ------- Validators & Utils -------
  String? _notEmpty(String? v) =>
      (v == null || v.trim().isEmpty) ? 'กรุณากรอกข้อมูล' : null;
}

/// ----------------- Models -----------------
class _Member {
  final String name;
  final String email;
  final String role;
  _Member({required this.name, required this.email, required this.role});
}

class _Session {
  final String device;
  final String location;
  final String lastActive;
  _Session({required this.device, required this.location, required this.lastActive});
}

/// ----------------- Reusable UI -----------------
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

class _CardHeader extends StatelessWidget {
  const _CardHeader({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.child,
    this.spacing = 6,
    super.key,
  });

  final String label;
  final Widget child;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: spacing),
        child,
      ],
    );
  }
}

/// -------------- Small helper --------------
void _toast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}