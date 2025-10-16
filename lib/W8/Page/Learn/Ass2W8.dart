import 'package:flutter/material.dart';

class Ass2W8 extends StatefulWidget {
  const Ass2W8({super.key});

  @override
  State<Ass2W8> createState() => _Ass2W8State();
}

class _Ass2W8State extends State<Ass2W8> {
  final List<Map<String, dynamic>> CatInfo = [
    {"Name": "KingKa Card", "Price": 700, "Image": "assets/images/Cat1.png"},
    {"Name": "LoPing Card", "Price": 800, "Image": "assets/images/Cat2.png"},
  ];

  // Cart เก็บแค่จำนวน
  final Map<String, int> Cart = {};

  @override
  Widget build(BuildContext context) {
    int totalTabs = CatInfo.length + 1; // +1 สำหรับ Cart tab

    return DefaultTabController(
      length: totalTabs,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Demo'),
          bottom: TabBar(
            tabs: List.generate(totalTabs, (index) {
              if (index < CatInfo.length) {
                return Tab(text: CatInfo[index]['Name']);
              } else {
                return const Tab(text: 'Cart');
              }
            }),
          ),
        ),
        body: TabBarView(
          children: List.generate(totalTabs, (index) {
            if (index < CatInfo.length) {
              final cat = CatInfo[index];
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      cat['Name'] + " " + cat['Price'].toString() + " Baht",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Image.asset(cat['Image'], width: 200),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Cart[cat['Name']] = (Cart[cat['Name']] ?? 0) + 1;
                          print(Cart);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        "ADD TO CART",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              int allTotal = 0;

              for (int i = 0; i < CatInfo.length; i++) {
                String name = CatInfo[i]['Name'];
                int amount = Cart[name] ?? 0;
                int total = amount * (CatInfo[i]['Price'] as int);
                allTotal += total;
              }
              return Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      ...List.generate(CatInfo.length, (i) {
                        String name = CatInfo[i]['Name'];
                        int amount = Cart[name] ?? 0;
                        int total = amount * CatInfo[i]['Price'] as int;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "$name x $amount = $total Baht",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        );
                      }),

                      Text(
                        "Total = $allTotal Baht",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),

                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Cart.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          "DELETE ALL",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
