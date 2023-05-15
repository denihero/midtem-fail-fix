import 'dart:math';

import 'package:flutter/material.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  int numberOne = 0;
  int numberTwo = 0;
  int total = 0;
  Color answerCorrect = Colors.green;
  int numberLimit = 10;

  late TextEditingController answerController;
  late TextEditingController numberLimitController;

  @override
  void initState() {
    answerController = TextEditingController();
    numberLimitController = TextEditingController(
      text: '$numberLimit',
    );
    numberOne = Random().nextInt(numberLimit);
    numberTwo = Random().nextInt(numberLimit);
    total = numberOne + numberTwo;
    super.initState();
  }

  String dropdownvalue = 'Кошумча';
  var items = ["Көбөйтүү", "Бөлүү", "Кошумча", "Кемитүү"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тажрыйба'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$numberOne ${giveNeedSymbol()} $numberTwo = ',
                  style: TextStyle(fontSize: 50, color: answerCorrect),
                ),
                SizedBox(
                  width: 80,
                  child: TextFormField(
                    controller: answerController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 50, color: answerCorrect),
                    decoration: const InputDecoration(),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    checkIsCorrect();
                  },
                  iconSize: 70,
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                  )),
            ),
            SizedBox(
              height: 200,
              width: 400,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 100),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Сан чеги'),
                          SizedBox(
                            width: 50,
                            child: TextFormField(
                              controller: numberLimitController,
                              style: const TextStyle(fontSize: 20),
                              onEditingComplete: () {
                                numberLimit =
                                    int.tryParse(numberLimitController.text)!;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 100),
                    child: SizedBox(
                      child: DropdownButton(
                          value: dropdownvalue,
                          items: items.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownvalue = value!;
                            });

                            changeSymbolValue();
                          }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String giveNeedSymbol() {
    if (dropdownvalue == 'Кошумча') {
      return '+';
    } else if (dropdownvalue == 'Кемитүү') {
      return '-';
    } else if (dropdownvalue == 'Бөлүү') {
      return '/';
    } else if (dropdownvalue == 'Көбөйтүү') {
      return '*';
    }
    return '';
  }

  void changeSymbolValue() {
    if (dropdownvalue == 'Кошумча') {
      total = numberOne + numberTwo;
    } else if (dropdownvalue == 'Кемитүү') {
      total = numberOne - numberTwo;
    } else if (dropdownvalue == 'Бөлүү') {
      total = numberOne ~/ numberTwo;
    } else if (dropdownvalue == 'Көбөйтүү') {
      total = numberOne * numberTwo;
    }
  }

  void checkIsCorrect() {
    if (int.tryParse(answerController.text) == total) {
      setState(() {
        numberOne = Random().nextInt(numberLimit);
        numberTwo = Random().nextInt(numberLimit);
        if (numberOne == 0 && dropdownvalue == 'dropdownvalue') {
          numberOne = Random().nextInt(numberLimit);
        }

        changeSymbolValue();

        answerCorrect = Colors.green;
      });
      answerController.clear();
    } else {
      setState(() {
        answerCorrect = Colors.red;
      });
    }
  }
}
