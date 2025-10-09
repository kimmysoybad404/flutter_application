import 'package:flutter/material.dart';

class WifiPage extends StatefulWidget {
  const WifiPage({super.key});

  @override
  State<WifiPage> createState() => _WifiPageState();
}

class _WifiPageState extends State<WifiPage> {
  final _formKey = GlobalKey<FormState>();
  final _ssidCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _ssidCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text('Wi-Fi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _LabeledField(
                  label: 'SSID (ชื่อ Wi-Fi)',
                  child: TextFormField(
                    controller: _ssidCtrl,
                    decoration: const InputDecoration(
                      hintText: 'เช่น Home_2.4G',
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'กรุณากรอก SSID' : null,
                  ),
                ),
                const SizedBox(height: 12),
                _LabeledField(
                  label: 'Password',
                  child: TextFormField(
                    controller: _passwordCtrl,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      hintText: 'รหัสผ่าน Wi-Fi',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => _showPassword = !_showPassword),
                        icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'กรุณากรอกรหัสผ่าน' : null,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _save,
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'แนะนำ: ใช้เครือข่าย 2.4GHz สำหรับ ESP32',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      _toast(context, 'กรุณากรอกข้อมูลให้ครบ');
      return;
    }

    final data = {
      'ssid': _ssidCtrl.text.trim(),
      'password': _passwordCtrl.text.trim(),
    };

    // TODO: ส่ง data ไปเก็บ/โปรวิชัน ESP32 ตามที่คุณใช้ (BLE / SoftAP / HTTP / MQTT)
    debugPrint('WIFI CONFIG: $data');

    _toast(context, 'บันทึกค่า Wi-Fi เรียบร้อย');
    Navigator.pop(context, data); // ส่งค่ากลับหน้าก่อน ถ้าต้องการใช้งานต่อ
  }
}

/// ---------- UI helper ----------
class _LabeledField extends StatelessWidget {
  const _LabeledField({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}

void _toast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}