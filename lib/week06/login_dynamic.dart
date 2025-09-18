import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(home: LoginDN()));
}


class LoginDN extends StatefulWidget {
  const LoginDN({super.key});


  @override
  State<LoginDN> createState() => _LoginDNState();
}


class _LoginDNState extends State<LoginDN> {
  List<Color> darkBgColors = [
    const Color(0xFF0D1441),
    const Color(0xFF283584),
    const Color(0xFF376AB2),
  ];


  List<Color> lightBgColors = [
    const Color(0xFF8C2480),
    const Color(0xFFCE587D),
    const Color(0xFFFF9485),
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();


    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        // or use infinity
        // width: double.infinity,
        // height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: now.hour < 18 ? lightBgColors : darkBgColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        now.hour < 18 ? 'Good Morning' : 'Good Evening',
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                      const Text(
                        'Please sign in below',
                        style: TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      const Text(
                        'Email',
                        style: TextStyle(color: Colors.white38),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: Colors.black.withValues(alpha: 0.1),
                          ),
                        ),
                        child: TextField(
                          controller: TextEditingController(
                            text: 'abc@mail.com',
                          ),
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Password',
                        style: TextStyle(color: Colors.white38),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: Colors.black.withValues(alpha: 0.1),
                          ),
                        ),
                        child: TextField(
                          controller: TextEditingController(text: '1234'),
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: size.width,
                  child: Image.asset(
                    'assets/images/landscape.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
