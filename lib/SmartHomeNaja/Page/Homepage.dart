import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> devices = [
    {"name": "LED", "room": "Bedroom", "icon": Icons.lightbulb, "isOn": false},
    {"name": "Fan", "room": "Living Room", "icon": Icons.air, "isOn": false},
    {
      "name": "Air Conditioner",
      "room": "Office",
      "icon": Icons.ac_unit,
      "isOn": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 80,
              width: 320,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.cloud, color: Colors.white, size: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Day",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "Time",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Text(
                      "28°C",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          SizedBox(
            height: 350,
            width: 350,
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemCount: devices.length,
              itemBuilder: (context, index) {
                var device = devices[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 236, 236, 236),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              device["icon"],
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                          const Spacer(),

                          SwitchTheme(
                            data: SwitchThemeData(
                              trackColor: MaterialStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.blue;
                                }
                                return const Color.fromARGB(
                                  255,
                                  207,
                                  207,
                                  207,
                                ); 
                              }),
                              thumbColor: MaterialStateProperty.all(
                                Colors.white,
                              ), 
                              trackOutlineColor:
                                  MaterialStateProperty.resolveWith((states) {
                                    if (states.contains(
                                      MaterialState.selected,
                                    )) {
                                      return Colors
                                          .blueAccent; 
                                    }
                                    return const Color.fromARGB(
                                      255,
                                      207,
                                      207,
                                      207,
                                    ); 
                                  }),
                            ),
                            child: Switch(
                              value: device["isOn"],
                              onChanged: (val) {
                                setState(() {
                                  device["isOn"] = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        device["name"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        device["room"],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
