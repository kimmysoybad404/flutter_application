import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String day = "--/--/--";
  String time = "--:--:--";
  String temperature = "-- °C";

  final dbRef = FirebaseDatabase.instance.ref();
  Timer? _timer;

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

  void startClock() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      setState(() {
        day = DateFormat("d EEEE MMMM yyyy").format(now);
        time = DateFormat("HH:mm:ss").format(now);
      });
    });
  }

  String getTodayPath() {
    final now = DateTime.now();
    return DateFormat("yyyy-MM-dd").format(now);
  }

  void getLatestWeather() {
    final todayPath = getTodayPath();
    final weatherRef = dbRef.child("weather/$todayPath");

    weatherRef.limitToLast(1).onValue.listen((event) {
      if (event.snapshot.value != null) {
        final raw = event.snapshot.value as Map<Object?, Object?>;
        final data = raw.map(
          (key, value) => MapEntry(key.toString(), value.toString()),
        );

        String lastValue = data.values.last.toString();

        setState(() {
          temperature = lastValue;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startClock();
    getLatestWeather();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  IconData getWeatherIcon() {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour < 18) {
      return Icons.wb_sunny;
    } else if (hour >= 18 && hour < 20) {
      return Icons.cloud;
    } else {
      return Icons.nightlight_round;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 100,
              width: 340,
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
                  children: [
                    Icon(getWeatherIcon(), color: Colors.white, size: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          day,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Time : $time",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      temperature,
                      style: const TextStyle(
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
                                return const Color.fromARGB(255, 207, 207, 207);
                              }),
                              thumbColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                              trackOutlineColor:
                                  MaterialStateProperty.resolveWith((states) {
                                    if (states.contains(
                                      MaterialState.selected,
                                    )) {
                                      return Colors.blueAccent;
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
