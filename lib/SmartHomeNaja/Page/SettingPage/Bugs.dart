import 'package:flutter/material.dart';

class BugsAndSuggestionsPage extends StatefulWidget {
  const BugsAndSuggestionsPage({super.key});

  @override
  State<BugsAndSuggestionsPage> createState() => _BugsAndSuggestionsPageState();
}

class _BugsAndSuggestionsPageState extends State<BugsAndSuggestionsPage> {
  final _formKey = GlobalKey<FormState>();

  String _type = 'Bug'; // Bug | Suggestion
  String _severity = 'Medium'; // ใช้เมื่อเป็น Bug
  final _titleCtrl = TextEditingController();
  final _whereCtrl = TextEditingController(); // พบที่หน้า/อุปกรณ์ใด
  final _stepsCtrl = TextEditingController(); // ขั้นตอนเกิดปัญหา
  final _expectedCtrl = TextEditingController();
  final _actualCtrl = TextEditingController();
  final _suggestionCtrl = TextEditingController(); // ใช้เมื่อเป็น Suggestion
  bool _includeLogs = true;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _whereCtrl.dispose();
    _stepsCtrl.dispose();
    _expectedCtrl.dispose();
    _actualCtrl.dispose();
    _suggestionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text('Bugs and Suggestions'),
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
                // หัวเรื่อง
                _LabeledField(
                  label: 'หัวเรื่อง',
                  child: TextFormField(
                    controller: _titleCtrl,
                    decoration: const InputDecoration(
                      hintText: 'เช่น หลอดไฟไม่ตอบสนองเมื่อกดปุ่มปิด',
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'กรุณากรอกหัวเรื่อง'
                        : null,
                  ),
                ),
                const SizedBox(height: 12),

                // ประเภท
                _LabeledField(
                  label: 'ประเภท',
                  child: DropdownButtonFormField<String>(
                    value: _type,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'Bug', child: Text('Bug (บั๊ก)')),
                      DropdownMenuItem(value: 'Suggestion', child: Text('Suggestion (ข้อเสนอแนะ)')),
                    ],
                    onChanged: (v) => setState(() => _type = v ?? 'Bug'),
                  ),
                ),
                const SizedBox(height: 12),

                // หากเป็นบั๊ก: ความรุนแรง
                if (_type == 'Bug') ...[
                  _LabeledField(
                    label: 'ความรุนแรงของบั๊ก',
                    child: DropdownButtonFormField<String>(
                      value: _severity,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'Low', child: Text('Low')),
                        DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                        DropdownMenuItem(value: 'High', child: Text('High')),
                        DropdownMenuItem(value: 'Critical', child: Text('Critical')),
                      ],
                      onChanged: (v) => setState(() => _severity = v ?? 'Medium'),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // พบที่ไหน/อุปกรณ์อะไร
                _LabeledField(
                  label: 'พบที่หน้า/อุปกรณ์',
                  child: TextFormField(
                    controller: _whereCtrl,
                    decoration: const InputDecoration(
                      hintText: 'เช่น หน้า Dashboard / หลอดไฟห้องนั่งเล่น',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // หากเป็นบั๊ก: ขั้นตอน/คาดหวัง/ผลจริง
                if (_type == 'Bug') ...[
                  _LabeledField(
                    label: 'ขั้นตอนที่ทำให้เกิดปัญหา',
                    child: TextFormField(
                      controller: _stepsCtrl,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: '1) เปิดแอป → 2) ไปที่ Devices → 3) กดปิดหลอดไฟ ...',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) {
                        if (_type == 'Bug' && (v == null || v.trim().isEmpty)) {
                          return 'กรุณาระบุขั้นตอนเกิดปัญหา';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 12),

                  _LabeledField(
                    label: 'ผลที่คาดหวัง',
                    child: TextFormField(
                      controller: _expectedCtrl,
                      decoration: const InputDecoration(
                        hintText: 'เช่น หลอดไฟควรดับลงทันที',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) {
                        if (_type == 'Bug' && (v == null || v.trim().isEmpty)) {
                          return 'กรุณาระบุผลที่คาดหวัง';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 12),

                  _LabeledField(
                    label: 'ผลที่เกิดขึ้นจริง',
                    child: TextFormField(
                      controller: _actualCtrl,
                      decoration: const InputDecoration(
                        hintText: 'เช่น หลอดไฟยังคงสว่างหรือตอบสนองช้า',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) {
                        if (_type == 'Bug' && (v == null || v.trim().isEmpty)) {
                          return 'กรุณาระบุผลที่เกิดขึ้นจริง';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // หากเป็นข้อเสนอแนะ: อธิบายไอเดีย
                if (_type == 'Suggestion') ...[
                  _LabeledField(
                    label: 'ข้อเสนอแนะ (อธิบายให้ชัดเจน)',
                    child: TextFormField(
                      controller: _suggestionCtrl,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: 'เช่น เพิ่มโหมดตั้งเวลาเปิด/ปิดเป็นรายห้อง',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) {
                        if (_type == 'Suggestion' && (v == null || v.trim().isEmpty)) {
                          return 'กรุณาระบุข้อเสนอแนะ';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // แนบไฟล์/ภาพ (ตัวอย่างปุ่ม)
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: เปิดตัวเลือกไฟล์/รูป (ใช้ file_picker/image_picker + permission ตามแพลตฟอร์ม)
                        _snack(context, 'แนบไฟล์ (ตัวอย่าง): ยังไม่เชื่อมกับระบบเลือกไฟล์');
                      },
                      icon: const Icon(Icons.attach_file),
                      label: const Text('แนบไฟล์/ภาพ'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'แนบหลักฐานจะช่วยให้แก้ปัญหาเร็วขึ้น',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // รวม log
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _includeLogs,
                  onChanged: (v) => setState(() => _includeLogs = v),
                  title: const Text('แนบบันทึกการสั่งงาน (Logs) เพื่อช่วยตรวจสอบ'),
                ),
                const SizedBox(height: 16),

                // ปุ่มส่ง
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.send),
                    label: const Text('ส่งรายงาน'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      _snack(context, 'กรุณากรอกข้อมูลให้ครบถ้วน');
      return;
    }

    // สร้าง payload เบื้องต้น
    final payload = {
      'type': _type,
      'severity': _type == 'Bug' ? _severity : null,
      'title': _titleCtrl.text.trim(),
      'where': _whereCtrl.text.trim(),
      'steps': _type == 'Bug' ? _stepsCtrl.text.trim() : null,
      'expected': _type == 'Bug' ? _expectedCtrl.text.trim() : null,
      'actual': _type == 'Bug' ? _actualCtrl.text.trim() : null,
      'suggestion': _type == 'Suggestion' ? _suggestionCtrl.text.trim() : null,
      'includeLogs': _includeLogs,
      'createdAt': DateTime.now().toIso8601String(),
    };

    // TODO: ส่ง payload ไปเซิร์ฟเวอร์/อีเมล/Firestore ของคุณ
    // ตัวอย่างแสดงผลเฉย ๆ
    debugPrint('BUG/SUGGEST PAYLOAD: $payload');

    _snack(context, 'ส่งข้อมูลเรียบร้อย ขอบคุณสำหรับการแจ้ง!');
    Navigator.pop(context); // ปิดหน้านี้หลังส่งสำเร็จ (เอาออกได้ถ้าไม่ต้องการ)
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}

void _snack(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}