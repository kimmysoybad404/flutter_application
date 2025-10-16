import 'package:flutter/material.dart';


class TabDemo extends StatelessWidget {
  const TabDemo({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.train),
                text: 'Train',
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: 'Bike',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.yellow,
            child: const Text('Home'),
          ),
          Container(
            color: Colors.green,
            child: const Text('Train'),
          ),
          Container(
            color: Colors.orange,
            child: const Text('Bike'),
          ),
        ]),
      ),
    );
  }
}

