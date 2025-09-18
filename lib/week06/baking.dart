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
          Expanded(flex: 6, child: Image.asset('assets/image/baking.jpg', fit: BoxFit.cover,)),

          Expanded(flex: 4, child: Column(
            children: [
              const Spacer(flex: 1,),
              Text('Baking lesson'.toUpperCase(), style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 30,),),
              
              Text('Master the art of baking'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 30,),),
              const Spacer(flex: 1,),
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
