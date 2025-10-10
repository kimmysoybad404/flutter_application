import 'package:flutter/material.dart';
import 'package:flutter_application/SmartHomeNaja/Page/Appbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'VoicePage/voice_helper.dart';
import 'dart:math' as math;

class VoiceCommandPage extends StatefulWidget {
  const VoiceCommandPage({super.key});

  @override
  State<VoiceCommandPage> createState() => _VoiceCommandPageState();
}

class _VoiceCommandPageState extends State<VoiceCommandPage>
    with SingleTickerProviderStateMixin {
  final VoiceHelper _voice = VoiceHelper();
  bool _isListening = false;
  String _recognizedText = "Tap microphone to start";
  late AnimationController _animationController;
  final dbRef = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startListening() {
    setState(() => _isListening = true);

    _voice.startListening((text, success) async {
      setState(() {
        _isListening = false;
      });

      String lowerText = text.toLowerCase();

      // ✅ Mapping คำสั่งทั้งหมด → Firebase path + action
      final commands = [
        // 🔸 ภาษาไทย
        {
          "keywords": ["เปิดไฟ"],
          "path": "devices/led",
          "action": true,
          "msgOn": "💡 เปิดไฟแล้ว",
          "msgAlready": "💡 ไฟเปิดอยู่แล้ว",
        },
        {
          "keywords": ["ปิดไฟ"],
          "path": "devices/led",
          "action": false,
          "msgOn": "💡 ปิดไฟแล้ว",
          "msgAlready": "💡 ไฟปิดอยู่แล้ว",
        },

        {
          "keywords": ["เปิดพัดลม"],
          "path": "devices/fan",
          "action": true,
          "msgOn": "🌀 เปิดพัดลมแล้ว",
          "msgAlready": "🌀 พัดลมเปิดอยู่แล้ว",
        },
        {
          "keywords": ["ปิดพัดลม"],
          "path": "devices/fan",
          "action": false,
          "msgOn": "🌀 ปิดพัดลมแล้ว",
          "msgAlready": "🌀 พัดลมปิดอยู่แล้ว",
        },

        {
          "keywords": ["เปิดแอร์"],
          "path": "devices/ac",
          "action": true,
          "msgOn": "❄️ เปิดแอร์แล้ว",
          "msgAlready": "❄️ แอร์เปิดอยู่แล้ว",
        },
        {
          "keywords": ["ปิดแอร์"],
          "path": "devices/ac",
          "action": false,
          "msgOn": "❄️ ปิดแอร์แล้ว",
          "msgAlready": "❄️ แอร์ปิดอยู่แล้ว",
        },

        // 🔸 ภาษาอังกฤษ (case insensitive)
        {
          "keywords": ["turn on light"],
          "path": "devices/led",
          "action": true,
          "msgOn": "💡 Light turned ON",
          "msgAlready": "💡 Light is already ON",
        },
        {
          "keywords": ["turn off light"],
          "path": "devices/led",
          "action": false,
          "msgOn": "💡 Light turned OFF",
          "msgAlready": "💡 Light is already OFF",
        },

        {
          "keywords": ["turn on fan"],
          "path": "devices/fan",
          "action": true,
          "msgOn": "🌀 Fan turned ON",
          "msgAlready": "🌀 Fan is already ON",
        },
        {
          "keywords": ["turn off fan"],
          "path": "devices/fan",
          "action": false,
          "msgOn": "🌀 Fan turned OFF",
          "msgAlready": "🌀 Fan is already OFF",
        },

        {
          "keywords": ["turn on air"],
          "path": "devices/ac",
          "action": true,
          "msgOn": "❄️ Air turned ON",
          "msgAlready": "❄️ Air is already ON",
        },
        {
          "keywords": ["turn off air"],
          "path": "devices/ac",
          "action": false,
          "msgOn": "❄️ Air turned OFF",
          "msgAlready": "❄️ Air is already OFF",
        },
      ];

      bool matched = false;

      for (var cmd in commands) {
        for (var keyword in cmd["keywords"] as List<String>) {
          if (text.contains(keyword) || lowerText.contains(keyword)) {
            matched = true;

            // 🔎 ดึงสถานะปัจจุบันจาก Firebase
            final snap = await dbRef.child(cmd["path"] as String).get();

            if (snap.exists) {
              bool current = snap.value == true;
              bool desired = cmd["action"] as bool;

              if (current == desired) {
                setState(() {
                  _recognizedText = cmd["msgAlready"] as String;
                });
              } else {
                await dbRef.child(cmd["path"] as String).set(desired);
                setState(() {
                  _recognizedText = cmd["msgOn"] as String;
                });
              }
            } else {
              setState(() {
                _recognizedText = "⚠️ ไม่พบข้อมูล ${cmd["path"]}";
              });
            }
            break;
          }
        }
        if (matched) break;
      }

      if (!matched) {
        setState(() {
          _recognizedText = "❓ I don't understand the word: $text";
        });
      }
    });
  }

  void _stopListening() {
    _voice.stopListening();
    setState(() => _isListening = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: VoiceCommandAppBar(isListening: _isListening),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Voice Wave Animation
                if (_isListening)
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return CustomPaint(
                        size: const Size(300, 100),
                        painter: WavePainter(_animationController.value),
                      );
                    },
                  ),

                const SizedBox(height: 40),

                // Microphone Button
                GestureDetector(
                  onTap: _isListening ? _stopListening : _startListening,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer Pulse Ring
                      if (_isListening)
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Container(
                              height: 150 + (20 * _animationController.value),
                              width: 150 + (20 * _animationController.value),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red.withOpacity(
                                  0.3 - (0.3 * _animationController.value),
                                ),
                              ),
                            );
                          },
                        ),

                      // Main Button
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: _isListening
                                ? [Colors.red.shade400, Colors.red.shade700]
                                : [
                                    Colors.blue.shade400,
                                    Colors.indigo.shade600,
                                  ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  (_isListening
                                          ? Colors.red
                                          : Colors.blueAccent)
                                      .withOpacity(0.4),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Icon(
                          _isListening ? Icons.mic : Icons.mic_none_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Status Text
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    _isListening ? "Listening..." : "Tap to speak",
                    key: ValueKey(_isListening),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: _isListening
                          ? Colors.red.shade700
                          : Colors.grey[600],
                    ),
                  ),
                ),

                if (_isListening)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_buildDot(0), _buildDot(150), _buildDot(300)],
                    ),
                  ),
              ],
            ),
          ),

          // Recognized Text Card
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.blueAccent,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Anwser',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  _recognizedText,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[900],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          // Quick Tips
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber[50],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: Colors.amber[700],
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Try: "turn on light" or "turn off light"',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.amber[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int delay) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final value = (_animationController.value * 1000 - delay) % 1000 / 1000;
        final opacity = (value < 0.5 ? value * 2 : (1 - value) * 2);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(opacity),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  final double progress;

  WavePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();
    final centerY = size.height / 2;
    final waveHeight = 30.0;

    for (double x = 0; x <= size.width; x++) {
      final normalizedX = x / size.width;
      final y =
          centerY +
          waveHeight *
              Math.sin((normalizedX * 4 * Math.pi) + (progress * 2 * Math.pi));
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;
}

class Math {
  static double sin(double x) => math.sin(x);
  static double pi = math.pi;
}
