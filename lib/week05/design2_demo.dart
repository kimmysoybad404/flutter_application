import 'package:flutter/material.dart';

class Design2Demo extends StatelessWidget {
  const Design2Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // https://www.iconarchive.com/download/i106639/diversity-avatars/avatars/batman.128.png
            
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  "https://www.iconarchive.com/download/i106639/diversity-avatars/avatars/batman.128.png",
                ),
              ),
            ),
                      Divider(color: Colors.grey, height: 60,),
            Text('Name', style: TextStyle(color: Colors.grey[400])),
            Text(
              'John Doe',
              style: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
            SizedBox(height: 16,),
            Text('Age', style: TextStyle(color: Colors.grey[400])),
            Text('22', style: TextStyle(color: Colors.yellow, fontSize: 22)),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.email, color: Colors.grey),
                Text(
                  'john_doe@test.com',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
