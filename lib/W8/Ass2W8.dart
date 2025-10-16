import 'package:flutter/material.dart';

class Ass2W8 extends StatelessWidget {
  const Ass2W8({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Suit'),
              Tab(text: 'Shoe'),
              Tab(text: 'Cart'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text('Dino 350 Baht', style: TextStyle(fontSize: 30)),
                    const SizedBox(height: 10),
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.asset("aessets/images/Dino.png"),
                    ),

                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(color: Colors.white, child: Text('Train')),
            Container(color: Colors.white, child: Text('Bike')),
          ],
        ),
      ),
    );
  }
}
