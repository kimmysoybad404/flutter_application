import 'package:flutter/material.dart';

class BugsAndSuggestionsPage extends StatefulWidget {
  const BugsAndSuggestionsPage({super.key});

  @override
  State<BugsAndSuggestionsPage> createState() => _BugsAndSuggestionsPageState();
}

class _BugsAndSuggestionsPageState extends State<BugsAndSuggestionsPage> {
  final _formKey = GlobalKey<FormState>();

  String _type = 'Bug'; // Bug | Suggestion
  String _severity = 'Medium';
  final _titleCtrl = TextEditingController();
  final _whereCtrl = TextEditingController();
  final _stepsCtrl = TextEditingController();
  final _expectedCtrl = TextEditingController();
  final _actualCtrl = TextEditingController();
  final _suggestionCtrl = TextEditingController();
  bool _includeLogs = true;
  bool _isSubmitting = false;

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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text(
          'Bugs & Suggestions',
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
                color: _type == 'Bug' ? Colors.red[50] : Colors.amber[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                _type == 'Bug' ? Icons.bug_report : Icons.lightbulb,
                size: 48,
                color: _type == 'Bug' ? Colors.red[700] : Colors.amber[700],
              ),
            ),
            const SizedBox(height: 24),

            // Form Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Report Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Type Selection
                    _LabeledField(
                      label: 'Type',
                      icon: Icons.category,
                      child: SegmentedButton<String>(
                        segments: const [
                          ButtonSegment(
                            value: 'Bug',
                            label: Text('Bug'),
                            icon: Icon(Icons.bug_report, size: 18),
                          ),
                          ButtonSegment(
                            value: 'Suggestion',
                            label: Text('Suggestion'),
                            icon: Icon(Icons.lightbulb, size: 18),
                          ),
                        ],
                        selected: {_type},
                        onSelectionChanged: (Set<String> newSelection) {
                          setState(() => _type = newSelection.first);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith(
                            (states) {
                              if (states.contains(WidgetState.selected)) {
                                return _type == 'Bug'
                                    ? Colors.red[100]
                                    : Colors.amber[100];
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title
                    _LabeledField(
                      label: 'Title',
                      icon: Icons.title,
                      child: TextFormField(
                        controller: _titleCtrl,
                        enabled: !_isSubmitting,
                        decoration: _inputDecoration(
                          hintText: 'e.g., Light doesn\'t respond when turned off',
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Please enter a title'
                            : null,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Severity (Bug only)
                    if (_type == 'Bug') ...[
                      _LabeledField(
                        label: 'Severity',
                        icon: Icons.priority_high,
                        child: DropdownButtonFormField<String>(
                          value: _severity,
                          decoration: _inputDecoration(),
                          items: [
                            _dropdownItem('Low', Colors.blue),
                            _dropdownItem('Medium', Colors.orange),
                            _dropdownItem('High', Colors.deepOrange),
                            _dropdownItem('Critical', Colors.red),
                          ],
                          onChanged: _isSubmitting
                              ? null
                              : (v) => setState(() => _severity = v ?? 'Medium'),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Location
                    _LabeledField(
                      label: 'Found at Page/Device',
                      icon: Icons.location_on_outlined,
                      child: TextFormField(
                        controller: _whereCtrl,
                        enabled: !_isSubmitting,
                        decoration: _inputDecoration(
                          hintText: 'e.g., Dashboard / Living room light',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Bug-specific fields
                    if (_type == 'Bug') ...[
                      _LabeledField(
                        label: 'Steps to Reproduce',
                        icon: Icons.format_list_numbered,
                        child: TextFormField(
                          controller: _stepsCtrl,
                          enabled: !_isSubmitting,
                          maxLines: 4,
                          decoration: _inputDecoration(
                            hintText:
                                '1) Open app → 2) Go to Devices → 3) Press light off...',
                          ),
                          validator: (v) {
                            if (_type == 'Bug' &&
                                (v == null || v.trim().isEmpty)) {
                              return 'Please describe the steps';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      _LabeledField(
                        label: 'Expected Result',
                        icon: Icons.check_circle_outline,
                        child: TextFormField(
                          controller: _expectedCtrl,
                          enabled: !_isSubmitting,
                          decoration: _inputDecoration(
                            hintText: 'e.g., Light should turn off immediately',
                          ),
                          validator: (v) {
                            if (_type == 'Bug' &&
                                (v == null || v.trim().isEmpty)) {
                              return 'Please describe expected result';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      _LabeledField(
                        label: 'Actual Result',
                        icon: Icons.error_outline,
                        child: TextFormField(
                          controller: _actualCtrl,
                          enabled: !_isSubmitting,
                          decoration: _inputDecoration(
                            hintText: 'e.g., Light stays on or responds slowly',
                          ),
                          validator: (v) {
                            if (_type == 'Bug' &&
                                (v == null || v.trim().isEmpty)) {
                              return 'Please describe actual result';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Suggestion field
                    if (_type == 'Suggestion') ...[
                      _LabeledField(
                        label: 'Your Suggestion',
                        icon: Icons.edit_note,
                        child: TextFormField(
                          controller: _suggestionCtrl,
                          enabled: !_isSubmitting,
                          maxLines: 6,
                          decoration: _inputDecoration(
                            hintText:
                                'e.g., Add scheduled on/off mode for each room',
                          ),
                          validator: (v) {
                            if (_type == 'Suggestion' &&
                                (v == null || v.trim().isEmpty)) {
                              return 'Please describe your suggestion';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Attach file button
                    OutlinedButton.icon(
                      onPressed: _isSubmitting
                          ? null
                          : () {
                              _snack(context,
                                  'Attach file feature (not yet connected)');
                            },
                      icon: const Icon(Icons.attach_file, size: 18),
                      label: const Text('Attach Files/Images'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Attaching evidence helps us resolve issues faster',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Include logs toggle
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: SwitchListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        value: _includeLogs,
                        onChanged: _isSubmitting
                            ? null
                            : (v) => setState(() => _includeLogs = v),
                        title: const Text(
                          'Include command logs for investigation',
                          style: TextStyle(fontSize: 14),
                        ),
                        secondary: Icon(Icons.description,
                            color: Colors.blue[400]),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Submit button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _isSubmitting ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _type == 'Bug'
                              ? Colors.red[600]
                              : Colors.amber[600],
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey[300],
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isSubmitting
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.send, size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    _type == 'Bug'
                                        ? 'Submit Bug Report'
                                        : 'Submit Suggestion',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({String? hintText}) {
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
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
    );
  }

  DropdownMenuItem<String> _dropdownItem(String value, Color color) {
    return DropdownMenuItem(
      value: value,
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      _snack(context, 'Please fill in all required fields', isError: true);
      return;
    }

    setState(() => _isSubmitting = true);

    try {
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

      // TODO: Send payload to server/email/Firestore
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
      debugPrint('BUG/SUGGEST PAYLOAD: $payload');

      if (mounted) {
        _snack(context,
            'Report submitted successfully! Thank you for your feedback.');
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        _snack(context, 'Failed to submit report: $e', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.child,
    required this.icon,
  });

  final String label;
  final Widget child;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: Colors.grey[700]),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

void _snack(BuildContext context, String msg, {bool isError = false}) {
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