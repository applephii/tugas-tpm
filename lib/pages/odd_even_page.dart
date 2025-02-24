import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OddEvenPage extends StatefulWidget {
  const OddEvenPage({super.key});

  @override
  _OddEvenPageState createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  final TextEditingController _numberController = TextEditingController();
  String _result = "";

  void _checkOddEven() {
    String input = _numberController.text.trim();
    if (input.isEmpty) {
      setState(() {
        _result = "Please enter a number";
      });
      return;
    }

    if (!RegExp(r'^-?\d{1,9}$').hasMatch(input) || input.length > 9) {
      setState(() {
        _result = "Invalid input! Enter a whole number (max 9 digits).";
      });
      return;
    }

    int number = int.parse(input);
    setState(() {
      _result = number % 2 == 0 ? "Even" : "Odd";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Odd or Even"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(251, 180, 72, 1),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 10),
              child: Text("Input number max 9 digits"),),
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^-?\d{0,9}$')),
                ],
                decoration: InputDecoration(
                  labelText: "Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _result,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _checkOddEven,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Check Here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
