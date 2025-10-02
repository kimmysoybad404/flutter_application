import 'package:flutter/material.dart';

class Statisticpage extends StatefulWidget {
  const Statisticpage({super.key});

  @override
  State<Statisticpage> createState() => _StatisticpageState();
}

class _StatisticpageState extends State<Statisticpage> {

  List<Map<String, dynamic>> statistics = [
    {
      "name": "LED",
      "device": 1,
      "kwh": 278,
      "icon": Icons.ac_unit,
      "highlight": true
    },
    {
      "name": "Smart TV",
      "device": 1,
      "kwh": 234,
      "icon": Icons.tv,
      "highlight": false
    },
    {
      "name": "Air Conditioner",
      "device": 1,
      "kwh": 487,
      "icon": Icons.speaker,
      "highlight": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text("Statistic"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: statistics.length,
        itemBuilder: (context, index) {
          var item = statistics[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: item["highlight"] ? Colors.blueAccent : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      item["icon"],
                      size: 30,
                      color: item["highlight"] ? Colors.white : Colors.black,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: item["highlight"]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Text(
                          "${item["device"]} Device",
                          style: TextStyle(
                            fontSize: 14,
                            color: item["highlight"]
                                ? Colors.white70
                                : Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "${item["kwh"]} kWh",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        item["highlight"] ? Colors.white : Colors.grey[800],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
