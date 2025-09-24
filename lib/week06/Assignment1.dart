import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Expanded(
              flex: 5,
              child: Image.asset(
                'assets/image/baking.jpg',
                fit: BoxFit.cover,
              ),
            ),

            
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Stack(
                  children: [
                
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'SIGN IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        _UnderlineField(
                          label: 'Email Address',
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),

                        
                        _UnderlineField(
                          label: 'Password',
                          icon: Icons.lock_outline,
                          obscure: true,
                        ),
                        const Spacer(),

                        
                        Row(
                          children: [
                            _CircleOutlinedIcon(
                              icon: Icons.adb,
                              onTap: () {},
                            ),
                            const SizedBox(width: 16),
                            _CircleOutlinedIcon(
                              icon: Icons.chat_bubble_outline,
                              onTap: () {},
                            ),
                            const Spacer(),
                            
                            _CircleFilledIcon(
                              icon: Icons.arrow_forward,
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _UnderlineField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscure;

  const _UnderlineField({
    required this.label,
    required this.icon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    final baseBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.25), width: 1),
    );
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white70,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: baseBorder,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.4),
        ),
      ),
    );
  }
}


class _CircleOutlinedIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _CircleOutlinedIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white54, width: 1.4),
          ),
          child: Icon(icon, color: Colors.white70),
        ),
      ),
    );
  }
}


class _CircleFilledIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _CircleFilledIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: const SizedBox(
          width: 60,
          height: 60,
          child: Center(
            child: Icon(Icons.arrow_forward, color: bgColor),
          ),
        ),
      ),
    );
  }
}