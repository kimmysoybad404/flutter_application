import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LanguagesPage extends StatefulWidget {
  /// ส่งค่าเริ่มต้นมาได้ เช่น 'th', 'en', 'ja' หรือ null ถ้ายังไม่เคยตั้ง
  final String? initialLocaleCode;

  /// ถ้าตั้ง true จะติ๊ก "Use system language" ให้ (ค่าเริ่มต้น false)
  final bool initialUseSystem;

  const LanguagesPage({
    super.key,
    this.initialLocaleCode,
    this.initialUseSystem = false,
  });

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  // เปิด/ปิด ใช้ภาษาตามระบบ
  late bool _useSystem;

  // โค้ดภาษาที่เลือก (เมื่อ _useSystem = true จะไม่ใช้ค่านี้)
  String? _selectedLocale;

  // รายการภาษาให้เลือก
  final List<_Lang> _langs = const [
    _Lang(code: 'th', name: 'ไทย (Thai)'),
    _Lang(code: 'en', name: 'English'),
    _Lang(code: 'ja', name: '日本語 (Japanese)'),
    _Lang(code: 'ko', name: '한국어 (Korean)'),
    _Lang(code: 'zh', name: '中文 (Chinese Simplified)'),
    _Lang(code: 'vi', name: 'Tiếng Việt (Vietnamese)'),
  ];

  // ตัวอย่างข้อความ Preview ต่อภาษา (เอาไว้โชว์หน้าจอลอง)
  final Map<String, Map<String, String>> _previewByLocale = {
    'th': {
      'title': 'ตัวอย่างภาษา',
      'on': 'เปิดไฟ',
      'off': 'ปิดไฟ',
      'status': 'สถานะ: เปิดอยู่',
    },
    'en': {
      'title': 'Language Preview',
      'on': 'Turn On Light',
      'off': 'Turn Off Light',
      'status': 'Status: On',
    },
    'ja': {
      'title': '言語プレビュー',
      'on': 'ライトをオン',
      'off': 'ライトをオフ',
      'status': '状態：オン',
    },
    'ko': {
      'title': '언어 미리보기',
      'on': '조명 켜기',
      'off': '조명 끄기',
      'status': '상태: 켜짐',
    },
    'zh': {'title': '语言预览', 'on': '打开灯', 'off': '关闭灯', 'status': '状态：打开'},
    'vi': {
      'title': 'Xem trước ngôn ngữ',
      'on': 'Bật đèn',
      'off': 'Tắt đèn',
      'status': 'Trạng thái: Bật',
    },
  };

  @override
  void initState() {
    super.initState();
    _useSystem = widget.initialUseSystem;
    _selectedLocale = widget.initialLocaleCode ?? 'th';
  }

  @override
  Widget build(BuildContext context) {
    // ภาษาที่ใช้แสดงใน Preview ตอนนี้
    final String effectiveLocale = _useSystem
        ? (_deviceLocaleCode() ?? _selectedLocale ?? 'th')
        : (_selectedLocale ?? 'th');

    final preview =
        _previewByLocale[effectiveLocale] ?? _previewByLocale['en']!;

    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text('Languages'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ----- การ์ด: ใช้ภาษาตามระบบ -----
            _GroupCard(
              children: [
                SwitchListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  value: _useSystem,
                  onChanged: (v) => setState(() => _useSystem = v),
                  title: const Text(
                    'Use system language',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    _useSystem
                        ? 'กำลังใช้ภาษาตามเครื่อง: ${_deviceLocaleCode() ?? 'unknown'}'
                        : 'ปิดอยู่: ใช้ภาษาที่เลือกด้านล่าง',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ----- การ์ด: เลือกภาษา -----
            _GroupCard(
              children: [
                for (int i = 0; i < _langs.length; i++) ...[
                  RadioListTile<String>(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    value: _langs[i].code,
                    groupValue: _selectedLocale,
                    onChanged: _useSystem
                        ? null // ถ้าใช้ระบบ ห้ามเลือกเอง
                        : (val) => setState(() => _selectedLocale = val),
                    title: Text(
                      _langs[i].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    secondary: Icon(
                      Icons.language,
                      color: Colors.black.withOpacity(0.75),
                      size: 22,
                    ),
                  ),
                  if (i != _langs.length - 1) const _TileDivider(),
                ],
              ],
            ),

            const SizedBox(height: 12),

            // ----- การ์ด: Preview -----
            _GroupCard(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      preview['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _previewRow(Icons.light_mode_outlined, preview['on']!),
                      const SizedBox(height: 8),
                      _previewRow(Icons.lightbulb_outline, preview['off']!),
                      const SizedBox(height: 8),
                      _previewRow(Icons.info_outline, preview['status']!),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ปุ่ม Save/Cancel
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context), // ไม่ส่งค่า
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // ส่งผลลัพธ์กลับไปหน้าเดิม
                      Navigator.pop(
                        context,
                        LanguagesResult(
                          useSystem: _useSystem,
                          localeCode: _selectedLocale,
                        ),
                      );
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // คืนค่าภาษาเครื่องแบบคร่าว ๆ เช่น 'th', 'en'
  String? _deviceLocaleCode() {
    final locale = Localizations.maybeLocaleOf(context);
    if (locale == null) return null;
    return locale.languageCode; // เช่น th, en, ja
  }

  Widget _previewRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
      ],
    );
  }
}

/// ----------------- Helpers -----------------

class _Lang {
  final String code;
  final String name;
  const _Lang({required this.code, required this.name});
}

/// object สำหรับรับค่าสรุปจากหน้า Languages กลับไปหน้าเดิม
class LanguagesResult {
  final bool useSystem; // true = ใช้ภาษาตามระบบ
  final String? localeCode; // ถ้า useSystem=true ค่านี้อาจไม่ถูกใช้
  LanguagesResult({required this.useSystem, required this.localeCode});
}

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
