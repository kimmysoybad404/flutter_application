import 'package:flutter/material.dart';

class Cabo extends StatefulWidget {
  const Cabo({super.key});

  @override
  State<Cabo> createState() => _CaboState();
}

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class _CaboState extends State<Cabo> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // รูปด้านบน
          Expanded(
            flex: 5,
            child: Image.asset(
              'assets/images/baking.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),

          // ส่วนล่าง
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SIGN IN + SIGN UP
                  Row(
                    children: [
                      Text(
                        "SIGN IN",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),

                  // Email
                  Row(
                    children: [
                      Icon(
                        Icons.alternate_email_rounded,
                        color: primaryColor,
                        size: 34,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextField(
                          controller: user,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Email Address",
                            hintStyle: TextStyle(color: Colors.white54, fontSize: 25),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Password
                  Row(
                    children: [
                      Icon(Icons.lock, color: primaryColor, size: 34),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextField(
                          controller: pass,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white54, fontSize: 25),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // ปุ่มด้านล่าง
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,bottom: 30),
                    child: Row(
                      children: [
                        // ไอคอน 2 ปุ่ม (ซ้ายล่าง)
                        Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(

                              side: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.adb),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                        ),

                        const SizedBox(width: 20),

                        Ink(
                          decoration: const ShapeDecoration(
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
                        
                        const Spacer(),
                    
                        // ปุ่ม login (→) ขวาล่าง
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(12),
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
