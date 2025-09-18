import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Demo')),
      body: SafeArea(
        child: Container(
          width: 5000,
          child: Image.asset('assets/image/sky.jpg'),
        
        ),
      ),
    );
  }
}
