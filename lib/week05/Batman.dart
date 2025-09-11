import 'package:flutter/material.dart';

class Design2Demo extends StatelessWidget {
  const Design2Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[800],
      body: Column(children: [
        //https://www.iconarchive.com/download/i111193/iconshock/super-heroes-sigma/Batman.128.png
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://www.iconarchive.com/download/i111193/iconshock/super-heroes-sigma/Batman.128.png'),
        ),
          Divider(color: Colors.grey, height: 60),
          Text('Name', style: TextStyle(color: Colors.grey[400]),
          ),
          Text('John Doe', style: TextStyle(color: Colors.yellow, fontSize: 22),
          ),
          SizedBox(height: 16),
          Text('Age', style: TextStyle(color: Colors.grey[400]),
          ),
          Text('22', style: TextStyle(color: Colors.yellow, fontSize: 22),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.email, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                'john_doe@test.com',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          )
      ],
      ),
    );
  }
}