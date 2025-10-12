import 'package:flutter/material.dart';

class Assignment73 extends StatefulWidget {
  const Assignment73({super.key});

  @override
  State<Assignment73> createState() => _Assignment73State();
}

class _Assignment73State extends State<Assignment73> {
  bool typeSwitch = false;
  double sliderValue1 = 1;
  String sugarLevel = 'normal',
      textSugarLevel = 'normal',
      hotOrCold = 'Hot',
      tyMsg = '',
      coffeeType = 'Latte',
      price = '35';
  int gValue = 0;
  Map imageUrl = {
    'Latte':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTR8Q_RrELDLpBSuhHF9CEAWgSBo9mRQtSy-g&s',
    'Americano':
        'https://assets.beanbox.com/blog_images/AB7ud4YSE6nmOX0iGlgA.jpeg',
    'Cappuccino':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5-Bw696xHgriG1Sz9qVWsffiJtZH2PDWxpw&s',
  };
  String defaultImageUrl = 'https://via.placeholder.com/150';
  
  void changeRadio(int? value) {
    setState(() {
      gValue = value!;

      if (value == 0) {
        coffeeType = 'Latte';
        price = '35';
      } else if (value == 1) {
        coffeeType = 'Americano';
        price = '30';
      } else {
        coffeeType = 'Cappuccino';
        price = '40';
      }
    });
  }

  void toggleTypeSwitch(bool? status) {
    setState(() {
      typeSwitch = status!;

      if (status == false) {
        hotOrCold = 'Hot';
      } else {
        hotOrCold = 'Cold';
      }
    });
  }

  void showAlert() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your order'),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0), 
          content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              imageUrl[coffeeType] ?? defaultImageUrl,
              fit: BoxFit.cover,
            ),
            
            const SizedBox(height: 20.0),
            
            Text(
              '$hotOrCold $coffeeType with $textSugarLevel sugar. Price = $price baht',
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20 ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('Cancel');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('OK');
                setState(() {
                  tyMsg = 'Thank you for your order!';
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MFU Coffee Shop'),
        backgroundColor: Colors.purple[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your order',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Coffee',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: gValue,
                          onChanged: changeRadio,
                        ),
                        Text('Latte 35'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: gValue,
                          onChanged: changeRadio,
                        ),
                        Text('Americano 30'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: gValue,
                          onChanged: changeRadio,
                        ),
                        Text('Cappuccino 40'),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        'Type',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('Hot'),
                    Switch(value: typeSwitch, onChanged: toggleTypeSwitch),
                    Text('Cold'),
                    Text('(+5)'),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sugar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Text('None'),
                    Expanded(
                      child: SizedBox(
                        child: Slider(
                          value: sliderValue1,
                          divisions: 2,
                          label: sugarLevel,
                          onChanged: (value) {
                            setState(() {
                              sliderValue1 = value;

                              if (sliderValue1 == 1) {
                                sugarLevel = 'normal';
                                textSugarLevel = 'normal';
                              } else if (sliderValue1 == 0.5) {
                                sugarLevel = 'less';
                                textSugarLevel = 'less';
                              } else {
                                sugarLevel = 'none';
                                textSugarLevel = 'no';
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Text('Normal'),
                  ],
                ),
              ),

              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      FilledButton(
                        onPressed: showAlert,
                        child: const Text('ORDER'),
                      ),

                      SizedBox(height: 30),
                      Text(
                        tyMsg,
                        style: TextStyle(fontSize: 25, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
