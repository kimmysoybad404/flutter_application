import 'package:flutter/material.dart';

class CloneRadio extends StatefulWidget {
  const CloneRadio({super.key});

  @override
  State<CloneRadio> createState() => _CloneRadioState();
}

class _CloneRadioState extends State<CloneRadio> {
  int gValue1 = 0, gValue2 = 2;

  void changeRadio1(int? value) {
    //value is a radio button's value
    //whenever value matches groupValue, radio is selected
    setState(() {
      gValue1 = value!;
    });
  }

  void changeRadio2(int? value) {
    setState(() {
      gValue2 = value!;
    });
  }

  List<Widget> createRadioGroup(int id) {
    List<Widget> radioList = [];
    for (int i = 0; i < 3; i++) {
      if (id == 1) {
        radioList.add(
          Radio(value: i, groupValue: gValue1, onChanged: changeRadio1),
        );
      } else {
        radioList.add(
          Radio(value: i, groupValue: gValue2, onChanged: changeRadio2),
        );
      }
      radioList.add(Text('$i'));
    }

    if (id == 1) {
      radioList.addAll([const Spacer(), Text('You choose $gValue1')]);
    } else {
      radioList.addAll([const Spacer(), Text('You choose $gValue2')]);
    }
    return radioList;
  }

  List<Widget> CrateRaidoNaja(int id) {
    List<Widget> radioList = List.generate(
      3,
      (index) => Radio(
        value: index,
        groupValue: id == 1 ? gValue1 : gValue2,
        onChanged: id == 1 ? changeRadio1 : changeRadio2,
      ),
    );

    radioList.addAll([
      const Spacer(),
      Text('You choose ${id == 1 ? gValue1 : gValue2}'),
    ]);

    return radioList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio Button Demo')),
      body: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Row(children: createRadioGroup(1)),
            Row(children: createRadioGroup(2)),
          ],
        ),
      ),
    );
  }
}
