import 'package:flutter/material.dart';

class Wedding extends StatefulWidget {
  const Wedding({super.key});

  @override
  State<Wedding> createState() => _WeddingState();
}

class _WeddingState extends State<Wedding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 140, 176),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Wedding Organiger",
              style: TextStyle(
                fontFamily: "Sevillana",
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),                              
            ),
            Text(
              "Pre-wedding, Photo, party",
              style: TextStyle(
                fontFamily: "Sevillana",
                fontSize: 30,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 17, 0),
              ),
              child: Text(
                "Our services",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
            Text(
              "345 Moo 1 Tasud Chiang Rai, Thailand",
              style: TextStyle(color: const Color.fromARGB(180, 255, 255, 255)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}