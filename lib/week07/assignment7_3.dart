import 'package:flutter/material.dart';

class Assignment73 extends StatefulWidget {
  const Assignment73({super.key});

  @override
  State<Assignment73> createState() => _Assignment73State();
}

class _Assignment73State extends State<Assignment73> {
 bool typeSwitch = false;
  double sliderValue1 = 1;
  String sugarLevel = 'normal';
  String hotOrCold = 'Hot';
  String textSugarLevel = 'normal';

  void toggleTypeSwitch(bool? status) {
    setState(() {
      typeSwitch = status!;

      if (status == false){
        hotOrCold = 'Hot';
      }else{
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
          content: Text('$hotOrCold coffee with $textSugarLevel sugar'),
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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your order',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Text('Type', textAlign: TextAlign.start)),
                    Text('Hot'),
                    Switch(value: typeSwitch, onChanged: toggleTypeSwitch),
                    Text('Cold'),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Sugar level'),
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

              Container(
                padding: const EdgeInsets.all(10),
                child: FilledButton(
                  onPressed: showAlert,
                  child: const Text('ORDER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
