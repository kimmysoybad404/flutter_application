import 'package:flutter/material.dart';


class Gun extends StatefulWidget {
  const Gun({super.key});


  @override
  State<Gun> createState() => _GunState();
}


class _GunState extends State<Gun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 255, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 59, 14),
        title: Text(
          "Thai nationality guns",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "KOCHASI MOD2020 14.5",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 12, 59, 14),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "เป็นปืนจู่โจมสำหรับการปฏิบัติการระบบประชิด มีขนาดกะทัดรัด เบา และแม่นยำด้วยระบบการทำงาน Shot Stroke Gas Piston ปืนเล็กยาวขนาด 5.56 มม. ความยาวลำกล้อง 14.5 นิ้ว เป็นปืนจู่โจมที่ได้กระสุน 5.56×45 มม. (M855 และ M193) สำหรับการปฏิบัติการระบบประชิด ที่ปืนเล็กยาวมาตรฐานจะยาวและเทอะทะทำให้ไอ้งานได้อย่างจำกัด มีขนาดกะทัดรัด เบา และแม่นยำด้วยระบบการทำงาน Shot Stroke Gas Piston สามารถปรับการยิงและปลดล็อคโดยตรงนำลูกเลื่อนได้ทั้งซ้ายและขวา มีราง Picatinny rail สำหรับติดตั้งอุปกรณ์เสริม และอุปกรณ์ช่วยเล็ง",
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 220,
                    child: Column(
                      children: [
                        Image.asset('assets/images/KOCHASI.jpg'),


                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 35),
                              Icon(Icons.star, color: Colors.amber, size: 35),
                              Icon(Icons.star, color: Colors.amber, size: 35),
                              Icon(Icons.star, color: Colors.amber, size: 35),
                              Icon(Icons.star, size: 35),
                            ],
                          ),
                        ),
                        Text("3128 reviews"),


                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 5),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.expand,
                                    size: 40,
                                    color: const Color.fromARGB(255, 125, 96, 150),
                                  ),


                                  Text("Caliber:" ,style: TextStyle(color: const Color.fromARGB(255, 125, 96, 150)),),
                                  Text("5.56 x 45" ,style: TextStyle(color: const Color.fromARGB(255, 125, 96, 150)),),
                                ],
                              ),


                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.forward_30,
                                      size: 40,
                                      color: const Color.fromARGB(255, 173, 0, 0),
                                    ),
                               
                                    Text("Mag:" ,style: TextStyle(color: const Color.fromARGB(255, 173, 0, 0)),),
                                    Text("Default 30" ,style: TextStyle(color: const Color.fromARGB(255, 173, 0, 0)),),
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.scale,
                                      size: 40,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                               
                                    Text("Weight:" ,style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
                                    Text("3.1 kg" ,style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}