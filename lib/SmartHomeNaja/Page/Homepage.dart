import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application/SmartHomeNaja/Page/Appbar.dart';
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
    {
      "name": "LED",
      "room": "Bedroom",
      "icon": Icons.lightbulb,
      "isOn": false,
      "color": Colors.amber,
      "bgColor": Colors.amber.shade50,
    },
    {
      "name": "Fan",
      "room": "Living Room",
      "icon": Icons.air,
      "isOn": false,
      "color": Colors.blue,
      "bgColor": Colors.blue.shade50,
    },
    {
      "name": "Air Conditioner",
      "room": "Office",
      "icon": Icons.ac_unit,
      "isOn": false,
      "color": Colors.cyan,
      "bgColor": Colors.cyan.shade50,
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
    final tempRef = dbRef.child("weather/$todayPath");

    tempRef.orderByKey().limitToLast(1).onValue.listen((event) {
      if (event.snapshot.value != null) {
        final raw = Map<String, dynamic>.from(event.snapshot.value as Map);

        String lastTemp = "--";
        raw.forEach((key, value) {
          if (value is Map && value["temperature"] != null) {
            lastTemp = value["temperature"].toString().split(" ").first;
          }
        });

        setState(() {
          temperature = "$lastTemp °C";
        });
      }
    });
  }

  void loadDeviceStates() {
    dbRef.child("devices").onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);

        setState(() {
          devices = [
            {
              "name": "LED",
              "room": "Bedroom",
              "icon": Icons.lightbulb,
              "isOn": data["led"] ?? false,
              "color": Colors.amber,
              "bgColor": Colors.amber.shade50,
            },
            {
              "name": "Fan",
              "room": "Living Room",
              "icon": Icons.air,
              "isOn": data["fan"] ?? false,
              "color": Colors.blue,
              "bgColor": Colors.blue.shade50,
            },
            {
              "name": "Air Conditioner",
              "room": "Office",
              "icon": Icons.ac_unit,
              "isOn": data["ac"] ?? false,
              "color": Colors.cyan,
              "bgColor": Colors.cyan.shade50,
            },
          ];
        });
      }
    });
  }

  void toggleDevice(String deviceName, bool value) {
    setState(() {
      final device = devices.firstWhere((d) => d["name"] == deviceName);
      device["isOn"] = value;
    });

    if (deviceName == "LED") {
      dbRef.child("devices/led").set(value);
    } else if (deviceName == "Fan") {
      dbRef.child("devices/fan").set(value);
    } else if (deviceName == "Air Conditioner") {
      dbRef.child("devices/ac").set(value);
    }
  }

  @override
  void initState() {
    super.initState();
    startClock();
    getLatestWeather();
    loadDeviceStates();
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

  Color getWeatherGradientStart() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 18) {
      return Colors.orange.shade400;
    } else if (hour >= 18 && hour < 20) {
      return Colors.blue.shade400;
    } else {
      return Colors.indigo.shade700;
    }
  }

  Color getWeatherGradientEnd() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 18) {
      return Colors.amber.shade600;
    } else if (hour >= 18 && hour < 20) {
      return Colors.purple.shade400;
    } else {
      return Colors.purple.shade900;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              
              // Weather Card with Gradient
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      getWeatherGradientStart(),
                      getWeatherGradientEnd(),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: getWeatherGradientStart().withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        getWeatherIcon(),
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            day,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            time,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "21 °C",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Devices',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    '${devices.length} devices',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Devices Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.95,
                ),
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  var device = devices[index];
                  final isOn = device["isOn"] as bool;
                  
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          toggleDevice(device["name"], !isOn);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: isOn 
                                          ? device["color"].withOpacity(0.2)
                                          : Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      device["icon"],
                                      color: isOn 
                                          ? device["color"]
                                          : Colors.grey.shade400,
                                      size: 28,
                                    ),
                                  ),
                                  SwitchTheme(
                                    data: SwitchThemeData(
                                      trackColor: MaterialStateProperty.resolveWith(
                                        (states) {
                                          if (states.contains(MaterialState.selected)) {
                                            return device["color"];
                                          }
                                          return Colors.grey[300];
                                        },
                                      ),
                                      thumbColor: MaterialStateProperty.all(Colors.white),
                                    ),
                                    child: Switch(
                                      value: isOn,
                                      onChanged: (val) {
                                        toggleDevice(device["name"], val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                device["name"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      device["room"],
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isOn 
                                      ? Colors.green.shade50
                                      : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: isOn 
                                            ? Colors.green
                                            : Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      isOn ? 'Active' : 'Inactive',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: isOn 
                                            ? Colors.green.shade700
                                            : Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}