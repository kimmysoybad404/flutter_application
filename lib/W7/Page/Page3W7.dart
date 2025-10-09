import 'package:flutter/material.dart';

class Page3W7 extends StatefulWidget {
  const Page3W7({super.key});

  @override
  State<Page3W7> createState() => _Page3W7State();
}

class _Page3W7State extends State<Page3W7> {
  bool sw = false;
  double sliderValue2 = 0;
  String TextSugar = "no";
  String LabelSugar = "none";
  String TypeHorC = "Hot";
  String TextCoffee = "Latte";
  int Baht = 35;
  int TypeCoffee = 0;
  String ThankText = "";

  List ImageCoffee = [
    "assets/images/Americano.jpeg",
    "assets/images/Cappuccino.jpg",
    "assets/images/Latte.jpg",
  ];

  List Coffee = ["Latte 35", "Americano 30", "Cappuccino 40"];

  void SelectType(bool? status) {
    setState(() {
      sw = status!;
      if (sw == true) {
        TypeHorC = "Cold";
      } else {
        TypeHorC = "Hot";
      }
    });
  }

  void SelectCofffe(int? value) {
    setState(() {
      TypeCoffee = value!;
      if (TypeCoffee == 0) {
        TextCoffee = "Latte";
        Baht = 35;
      } else if (TypeCoffee == 1) {
        TextCoffee = "Americano";
        Baht = 30;
      } else if (TypeCoffee == 2) {
        TextCoffee = "Cappuccino";
        Baht = 40;
      }
    });
  }

  void showAlert() async {
    setState(() {
      ThankText = "Thank you for your order!";
    });

    int totalPrice = Baht;
    if (sw == true) {
      totalPrice += 5;
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(ImageCoffee[TypeCoffee], fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              Text(
                '$TypeHorC $TextCoffee coffee with $TextSugar sugar.\nPrice = $totalPrice',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> radios = List.generate(
      Coffee.length,
      (index) => Row(
        children: [
          Radio<int>(
            value: index,
            groupValue: TypeCoffee,
            onChanged: SelectCofffe,
          ),
          Text(Coffee[index]),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MFU Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("Your Order", style: TextStyle(fontSize: 30)),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Coffee",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(children: radios),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text("Type"),
                  Spacer(),
                  Text("Hot"),
                  Switch(value: sw, onChanged: SelectType),
                  Text("Cold(+5)"),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sugar level"),
                Slider(
                  min: 0,
                  max: 100,
                  value: sliderValue2,
                  divisions: 2,
                  label: LabelSugar,
                  onChanged: (value) {
                    sliderValue2 = value;
                    setState(() {
                      if (value == 0) {
                        TextSugar = "no";
                        LabelSugar = "none";
                      } else if (value == 50) {
                        TextSugar = "less";
                        LabelSugar = "less";
                      } else if (value == 100) {
                        TextSugar = "normal";
                        LabelSugar = "normal";
                      }
                    });
                  },
                ),
                Text("Normal"),
              ],
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: showAlert,
              child: Text("ORDER", style: TextStyle(color: Colors.white)),
            ),

            const SizedBox(height: 20),

            Text(
              ThankText ?? "",
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
