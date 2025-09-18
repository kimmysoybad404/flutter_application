import 'package:flutter/material.dart';
const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class BakingApp extends StatelessWidget {
  const BakingApp({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset('assets/images/baking.jpg', fit: BoxFit.cover),
          ),
          Expanded(
            child: Column(
              children: [
                const Spacer(flex: 1),
                Text(
                  'Baking lessons'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Text(
                  'Master the art of baking'.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                const Spacer(flex: 2),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                  iconAlignment: IconAlignment.end,
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: bgColor,
                  ),
                  label: Text(
                    'Start learning'.toUpperCase(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
