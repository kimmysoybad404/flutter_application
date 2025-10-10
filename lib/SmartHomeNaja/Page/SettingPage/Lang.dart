import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LanguagesPage extends StatefulWidget {
  final String? initialLocaleCode;
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
  late bool _useSystem;
  String? _selectedLocale;

  final List<_Lang> _langs = const [
    _Lang(code: 'th', name: 'ไทย', nativeName: 'Thai', flag: '🇹🇭'),
    _Lang(code: 'en', name: 'English', nativeName: 'English', flag: '🇺🇸'),
    _Lang(code: 'ja', name: '日本語', nativeName: 'Japanese', flag: '🇯🇵'),
    _Lang(code: 'ko', name: '한국어', nativeName: 'Korean', flag: '🇰🇷'),
    _Lang(code: 'zh', name: '中文', nativeName: 'Chinese', flag: '🇨🇳'),
    _Lang(code: 'vi', name: 'Tiếng Việt', nativeName: 'Vietnamese', flag: '🇻🇳'),
  ];

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
    final String effectiveLocale = _useSystem
        ? (_deviceLocaleCode() ?? _selectedLocale ?? 'th')
        : (_selectedLocale ?? 'th');

    final preview =
        _previewByLocale[effectiveLocale] ?? _previewByLocale['en']!;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text(
          'Languages',
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
                Icons.language,
                size: 48,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 24),

            // System Language Card
            _GroupCard(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: [
                        Icon(Icons.settings, size: 20, color: Colors.blue[700]),
                        const SizedBox(width: 8),
                        const Text(
                          'System Settings',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SwitchListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    value: _useSystem,
                    onChanged: (v) => setState(() => _useSystem = v),
                    title: const Text(
                      'Use system language',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      _useSystem
                          ? 'Following device: ${_deviceLocaleCode()?.toUpperCase() ?? 'unknown'}'
                          : 'Manual selection enabled',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    secondary: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _useSystem ? Colors.blue[50] : Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.sync,
                        color: _useSystem ? Colors.blue[700] : Colors.grey[600],
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Languages Selection Card
            _GroupCard(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: [
                        Icon(Icons.translate, size: 20, color: Colors.blue[700]),
                        const SizedBox(width: 8),
                        const Text(
                          'Choose Language',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (int i = 0; i < _langs.length; i++) ...[
                    _LanguageTile(
                      lang: _langs[i],
                      isSelected: _selectedLocale == _langs[i].code,
                      isEnabled: !_useSystem,
                      onTap: _useSystem
                          ? null
                          : () => setState(() => _selectedLocale = _langs[i].code),
                    ),
                    if (i != _langs.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(left: 76),
                        child: Divider(height: 1, thickness: 1, color: Colors.grey[200]),
                      ),
                  ],
                  const SizedBox(height: 8),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Preview Card
            _GroupCard(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.preview, size: 20, color: Colors.blue[700]),
                        const SizedBox(width: 8),
                        Text(
                          preview['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _PreviewRow(
                      icon: Icons.light_mode_outlined,
                      text: preview['on']!,
                      color: Colors.amber[600]!,
                    ),
                    const SizedBox(height: 12),
                    _PreviewRow(
                      icon: Icons.lightbulb_outline,
                      text: preview['off']!,
                      color: Colors.grey[600]!,
                    ),
                    const SizedBox(height: 12),
                    _PreviewRow(
                      icon: Icons.info_outline,
                      text: preview['status']!,
                      color: Colors.blue[600]!,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Colors.grey[300]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        LanguagesResult(
                          useSystem: _useSystem,
                          localeCode: _selectedLocale,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
                              const SizedBox(width: 12),
                              Text('Language saved: ${_useSystem ? 'System' : _selectedLocale?.toUpperCase()}'),
                            ],
                          ),
                          backgroundColor: Colors.green[700],
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.all(16),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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

  String? _deviceLocaleCode() {
    final locale = Localizations.maybeLocaleOf(context);
    if (locale == null) return null;
    return locale.languageCode;
  }
}

/// ----------------- Helpers -----------------

class _Lang {
  final String code;
  final String name;
  final String nativeName;
  final String flag;
  const _Lang({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.flag,
  });
}

class LanguagesResult {
  final bool useSystem;
  final String? localeCode;
  LanguagesResult({required this.useSystem, required this.localeCode});
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

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.lang,
    required this.isSelected,
    required this.isEnabled,
    this.onTap,
  });

  final _Lang lang;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onTap : null,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue[50] : Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  lang.flag,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isEnabled ? Colors.black87 : Colors.grey[400],
                    ),
                  ),
                  Text(
                    lang.nativeName,
                    style: TextStyle(
                      fontSize: 13,
                      color: isEnabled ? Colors.grey[600] : Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: Colors.blue[600], size: 24)
            else
              Icon(Icons.circle_outlined, color: Colors.grey[300], size: 24),
          ],
        ),
      ),
    );
  }
}

class _PreviewRow extends StatelessWidget {
  const _PreviewRow({
    required this.icon,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}