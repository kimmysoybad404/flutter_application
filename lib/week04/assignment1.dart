import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1> {
  TextEditingController tcUsername = TextEditingController();
  TextEditingController tcPassword = TextEditingController();
  String loginMessage = '';

  void checkLogin() {
    setState(() {
      String username = tcUsername.text;
      String password = tcPassword.text;
      if(username == "admin" && password == "1234"){
        loginMessage = 'Welcome admin';
      }
      else{
        loginMessage = 'Wrong username or password';
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 16.0, 5.0, 0),
            child: TextField(
              controller: tcUsername,
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 20.0),
            child: TextField(
              controller: tcPassword,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: checkLogin,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text('Login', style: TextStyle(color: Colors.white)),
          ),
          Padding(padding: const EdgeInsets.all(5.0)),
          Text(loginMessage, style: TextStyle(color: Colors.red),)
        ],
      ),
    );
  }
}
