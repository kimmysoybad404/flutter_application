import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 71, 138),
        title: Text("Tourist Place", style: TextStyle(color: Colors.white)),
      ),

      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/Clock.jpg"),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        "Chiang Tai Clock Tower",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 65),
                        child: Text(
                          "Chiang Rai, Thailand",
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(225, 88, 88, 88),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: Icon(
                    Icons.star,
                    color: const Color.fromARGB(255, 255, 7, 48),
                    size: 30,
                  ),
                ),
                Text("559"),
              ],
            ),

            Row(
              children: [
                Spacer(),
                Column(
                  children: [
                    Icon(Icons.call, color: Colors.blue, size: 30),
                    Text(
                      "CALL",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Icon(Icons.directions, color: Colors.blue, size: 30),
                    Text(
                      "ROUTE",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Icon(Icons.share, color: Colors.blue, size: 30),
                    Text(
                      "SHARE",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "The Chalermphrakiat Clock Tower is situated at the roundabout where Banphaprakan Road intersects with Suk Sathit and Chet Yot Road. It was built in 2005 to honor the 60th birthday of Her Majesty Queen Sirikit. Designed by national artist Achan Chalermchai Kositpipat, the tower is adorned with intricate golden patterns, making it a standout landmark, especially when illuminated at night. Visitors can enjoy a captivating 10-minute light and sound show every day at 19.00, 20.00, and 21.00 hrs.",
                style: TextStyle(fontSize: 16,),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
