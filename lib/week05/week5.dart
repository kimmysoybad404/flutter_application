import 'package:flutter/material.dart';


class Profile2 extends StatelessWidget {
 const Profile2({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.teal,
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         const CircleAvatar(
           backgroundImage: NetworkImage(
             'https://icons.iconarchive.com/icons/kidaubis-design/cool-heroes/128/Ironman-icon.png',
           ),
           radius: 50,
           backgroundColor: Colors.white,
         ),
         const SizedBox(height: 20),
         const Text(
           'Iron Man',
           style: TextStyle(
             color: Colors.white,
             fontSize: 25,
             fontStyle: FontStyle.italic,
           ),
         ),
         const SizedBox(height: 10),
         const Text(
           'FLUTTER DEVELOPER',
           style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
         ),
         const SizedBox(height: 10),
         Container(
           color: Colors.white,
           padding: const EdgeInsets.all(8),
           margin: const EdgeInsets.symmetric(horizontal: 8),
           child: const Row(
             children: [
               Icon(Icons.phone, color: Colors.teal),
               SizedBox(width: 8),
               Text('+66 012 345 6789'),
             ],
           ),
         ),
         const SizedBox(height: 8),
         Container(
           color: Colors.white,
           padding: const EdgeInsets.all(8),
           margin: const EdgeInsets.symmetric(horizontal: 8),
           child: const Row(
             children: [
               Icon(Icons.mail, color: Colors.teal),
               SizedBox(width: 8),
               Text('iron.man@mfu.ac.th'),
             ],
           ),
         ),
       ],
     ),
   );
 }
}
