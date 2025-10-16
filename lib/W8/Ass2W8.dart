import 'package:flutter/material.dart';

class Ass2W8 extends StatelessWidget {
  const Ass2W8({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> ItemInfo = [
      {"Name": "Dino", "Price": "350", "Image": "assets/images/Dino.png"},
      {"Name": "Diamond", "Price": "150", "Image": "assets/images/Diamond.png"},
    ];

      List<int> cartAmount = [0, 0];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Dino'),
              Tab(text: 'Diamond'),
              Tab(text: 'Cart'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
          for (int i = 0; i< ItemInfo.length;i++)
          buildItemPage(context, i),
            buildCartPage()
          ],
        ),
      ),
    );
  }

  Widget buildItemPage(BuildContext context, int index) {
          final item = ItemInfo[index];
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              '${item["Name"]} ${item["Price"]} Baht',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Container(
              height: 300,
              width: 300,
              child: Image.asset("${item["Image"]}"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
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
    );
  }
}

  Widget buildCartPage() {
    int total = 0;
    for (int i = 0; i < ItemInfo.length; i++) {
      total += cartAmount[i] * ItemInfo[i]['price'] as int;
    }

    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < ItemInfo.length; i++)
                Text(
                  '${ItemInfo[i]["name"]} ${ItemInfo[i]["price"]} x ${cartAmount[i]} = ${cartAmount[i] * itemInfo[i]["price"]} baht',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              const SizedBox(height: 20),
              Text(
                'Total = $total baht',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}