import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Demo')),
      body: Container(
        width: 200,
        height: 200,
        color: Colors.yellow,
        child: Image.asset("assets/images/sky.jpg"),
//         child: Image.network(
          
// 'https://i.pinimg.com/originals/2e/c6/b5/2ec6b5e14fe0cba0cb0aa5d2caeeccc6.jpg',
//         ),
      ),
    );
  }
}

