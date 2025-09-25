//6631501003
import 'package:flutter/material.dart';
import 'dart:math';

class Fishing extends StatefulWidget {
  const Fishing({super.key});

  @override
  State<Fishing> createState() => _FishingState();
}

class _FishingState extends State<Fishing> {
  int YourCoins = 0;
  int RandomFish = 5;
  int AmountRandom = 0;
  int ValueFish = 0;
  int worms = 5;
  String mass = "";
  String luffy = "aessets/images/lll.png";

  List fish = [
    {'name': 'Fish', 'price': 20, 'image': 'aessets/images/fff.png'},
    {'name': 'Octopus', 'price': 10, 'image': 'aessets/images/ooo.png'},
    {'name': 'StarFish', 'price': 5, 'image': 'aessets/images/sss.png'},
    {'name': 'HouseWater', 'price': 10, 'image': 'aessets/images/hhh.png'},
  ];

  Widget buildWormIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        worms,(index) =>
            const Icon(Icons.waves_rounded, color: Colors.redAccent, size: 35),
      ),
    );
  }

  click() {
    setState(() {
      worms -= 1;
      RandomFish = Random().nextInt(4);
      AmountRandom = Random().nextInt(10) + 1;
      print("Random: $RandomFish");
      print("Amount: $AmountRandom");
      print("Worms: $worms");
      ValueFish = AmountRandom * fish[RandomFish]['price'] as int;
      YourCoins += ValueFish;
    });
  }

  checknoworn() {
    if (worms == 0) {
      print("in");
      return click();
    } else {
      return click;
    }
  }

  checkfirst() {
    if (RandomFish == 5) {
      return "aessets/images/lll.png";
    } else {
      return "${fish[RandomFish]['image']!}";
    }
  }

  checktextfirst() {
    if (RandomFish == 5) {
      return "";
    } else {
      return "${fish[RandomFish]["name"]!} x $AmountRandom = $ValueFish Coins";
    }
  }

  reset() {
    setState(() {
      worms = 5;
      RandomFish = 5;
      YourCoins = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Fishing Game", style: TextStyle(color: Colors.white)),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Worms:", style: TextStyle(fontSize: 18)),
              buildWormIcons(),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.currency_exchange, color: Colors.amber, size: 30),
              Text("$YourCoins", style: TextStyle(fontSize: 20)),
            ],
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: Image.asset(checkfirst()),
          ),

          const SizedBox(height: 50),

          Text(checktextfirst(), style: TextStyle(fontSize: 20)),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: checknoworn(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text("Fishing", style: TextStyle(color: Colors.white)),
          ),

          const SizedBox(height: 5),

          ElevatedButton(
            onPressed: reset,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text("Reset", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
