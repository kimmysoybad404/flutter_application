import 'package:flutter/material.dart';
import 'package:flutter_application/SmartHomeNaja/Page/Appbar.dart';

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
      "icon": Icons.lightbulb,
      "color": Colors.amber,
      "bgColor": Colors.amber.shade50,
      "highlight": true,
    },
    {
      "name": "Fan",
      "device": 1,
      "kwh": 234,
      "icon": Icons.air,
      "color": Colors.blue,
      "bgColor": Colors.blue.shade50,
      "highlight": false,
    },
    {
      "name": "Air Conditioner",
      "device": 1,
      "kwh": 487,
      "icon": Icons.ac_unit,
      "color": Colors.cyan,
      "bgColor": Colors.cyan.shade50,
      "highlight": false,
    },
  ];

  int getTotalKwh() {
    return statistics.fold(0, (sum, item) => sum + (item["kwh"] as int));
  }

  int getTotalDevices() {
    return statistics.fold(0, (sum, item) => sum + (item["device"] as int));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: statisticsAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // Summary Cards
              Row(
                children: [
                  Expanded(
                    child: _SummaryCard(
                      icon: Icons.flash_on,
                      label: 'Total Usage',
                      value: '${getTotalKwh()}',
                      unit: 'kWh',
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange.shade400,
                          Colors.deepOrange.shade600,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _SummaryCard(
                      icon: Icons.devices,
                      label: 'Total Devices',
                      value: '${getTotalDevices()}',
                      unit: 'devices',
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade400, Colors.indigo.shade600],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Device Usage',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'This Month',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Statistics List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: statistics.length,
                itemBuilder: (context, index) {
                  var item = statistics[index];
                  final isHighlight = item["highlight"] as bool;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      gradient: isHighlight
                          ? LinearGradient(
                              colors: [Colors.blueAccent, Colors.blue.shade700],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: isHighlight ? null : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: isHighlight
                              ? Colors.blueAccent.withOpacity(0.3)
                              : Colors.black.withOpacity(0.05),
                          blurRadius: isHighlight ? 15 : 10,
                          offset: Offset(0, isHighlight ? 8 : 4),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          setState(() {
                            for (var stat in statistics) {
                              stat["highlight"] = false;
                            }
                            item["highlight"] = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: isHighlight
                                      ? Colors.white.withOpacity(0.2)
                                      : item["bgColor"],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  item["icon"],
                                  size: 28,
                                  color: isHighlight
                                      ? Colors.white
                                      : item["color"],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["name"],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isHighlight
                                            ? Colors.white
                                            : Colors.grey[900],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.power,
                                          size: 14,
                                          color: isHighlight
                                              ? Colors.white70
                                              : Colors.grey[600],
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "${item["device"]} Device",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: isHighlight
                                                ? Colors.white70
                                                : Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${item["kwh"]}",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: isHighlight
                                          ? Colors.white
                                          : Colors.grey[900],
                                    ),
                                  ),
                                  Text(
                                    "kWh",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: isHighlight
                                          ? Colors.white70
                                          : Colors.grey[600],
                                    ),
                                  ),
                                ],
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

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
    required this.gradient,
  });

  final IconData icon;
  final String label;
  final String value;
  final String unit;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  unit,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
