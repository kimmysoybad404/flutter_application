import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class Assignment61 extends StatefulWidget {
  const Assignment61({super.key});

  @override
  State<Assignment61> createState() => _Assignment61State();
}

class _Assignment61State extends State<Assignment61> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: Image.asset(
              'assets/images/baking.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Expanded(
            flex: 9,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Sign in'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Sign up'.toUpperCase(),
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 3),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      icon: const Icon(Icons.alternate_email),
                      iconColor: primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: const Icon(Icons.lock_open),
                      iconColor: primaryColor,
                    ),
                  ),
                ),
                const Spacer(flex: 6),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(
                              
                              side: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.android),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Ink(
                          decoration: ShapeDecoration(
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.message),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward),
                        style: FilledButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: bgColor,
                        ),
                      ),
                    ],
                  ),
                ),
                // FilledButton.icon(
                //   onPressed: () {},
                //   icon: const Icon(Icons.arrow_forward),
                //   iconAlignment: IconAlignment.end,
                //   style: FilledButton.styleFrom(
                //     backgroundColor: primaryColor,
                //     foregroundColor: bgColor,
                //   ),
                //   label: Text(
                //     'Start learning'.toUpperCase(),
                //     style: TextStyle(fontSize: 15),
                //   ),
                // ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
