import 'package:flutter/material.dart';
// import 'package:tugas1/pages/launcher.dart';
// import 'package:tugas1/pages/menu_page.dart';
import 'package:tugas1/widgets/kalkulator_button.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String textToDisplay = "0";
  String hist = "";
  String operation = "";
  List<String> inputList = [];

  void _onBtnPressed(String btnVal) {
    setState(() {
      if (btnVal == 'C') {
        textToDisplay = '';
      } else if (btnVal == "AC") {
        textToDisplay = '';
        hist = '';
        inputList.clear();
      } else if (btnVal == "+/-") {
        if (textToDisplay.isNotEmpty) {
          if (textToDisplay[0] != '-') {
            textToDisplay = '-' + textToDisplay;
          } else {
            textToDisplay = textToDisplay.substring(1);
          }
        }
      } else if (btnVal == "⌫") {
        if (textToDisplay.isNotEmpty) {
          textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1);
        }
      } else if (btnVal == "+" ||
          btnVal == "-" ||
          btnVal == "×" ||
          btnVal == "÷") {
        if (textToDisplay.isNotEmpty) {
          inputList.add(textToDisplay);
          inputList.add(btnVal);
          textToDisplay = '';
        }
      } else if (btnVal == '=') {
        if (textToDisplay.isNotEmpty) {
          inputList.add(textToDisplay);
          hist = inputList.join(' ');
          textToDisplay = _calculateResult(inputList).toString();
          inputList.clear();
        }
      } else {
        if (textToDisplay == "0") {
          textToDisplay = btnVal;
        } else {
          textToDisplay += btnVal;
        }
      }
    });
  }

  double _calculateResult(List<String> input) {
    // multiplication and division
    List<String> tempList = [];
    double result = double.parse(input[0]);

    for (int i = 1; i < input.length; i += 2) {
      String operator = input[i];
      double nextNumber = double.parse(input[i + 1]);

      if (operator == '×' || operator == '÷') {
        if (operator == '×') {
          result *= nextNumber;
        } else if (operator == '÷') {
          if (nextNumber == 0) {
            setState(() {
            textToDisplay = "Undefined";
          });
          // return 0;
          }
          result /= nextNumber;
        }
      } else {
        tempList.add(result.toString());
        tempList.add(operator);
        result = nextNumber;
      }
    }
    tempList.add(result.toString());

    // addition and subtraction
    result = double.parse(tempList[0]);
    for (int i = 1; i < tempList.length; i += 2) {
      String operator = tempList[i];
      double nextNumber = double.parse(tempList[i + 1]);

      if (operator == '+') {
        result += nextNumber;
      } else if (operator == '-') {
        result -= nextNumber;
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(251, 180, 72, 1),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },)
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment(1, 1),
              child: Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  hist,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment(1, 1),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  textToDisplay,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KalkulatorButton(
                    text: 'AC',
                    fillColor: Colors.orange,
                    textColor: Colors.white,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: 'C',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '⌫',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '÷',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KalkulatorButton(
                    text: '9',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '8',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '7',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '×',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KalkulatorButton(
                    text: '4',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '5',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '6',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '-',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KalkulatorButton(
                    text: '1',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '2',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '3',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '+',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KalkulatorButton(
                    text: '+/-',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '0',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '',
                    fillColor: Colors.white,
                    textColor: Colors.orange,
                    callback: _onBtnPressed),
                KalkulatorButton(
                    text: '=',
                    fillColor: Colors.orange,
                    textColor: Colors.white,
                    callback: _onBtnPressed),
              ],
            )
          ],
        ),
      ),
    );
  }
}
