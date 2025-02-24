import 'package:flutter/material.dart';

class OddEvenPage extends StatefulWidget {
  const OddEvenPage({super.key});

  @override
  _OddEvenPageState createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  final TextEditingController _numberController = TextEditingController();
  String _result = "";

  void _checkOddEven() {
    String input = _numberController.text;
    if (input.isEmpty) {
      setState(() {
        _result = "Please enter a number";
      });
      return;
    }

    int number = int.parse(input);

    if (!RegExp(r'^-?\d+\$').hasMatch(input) || input.length > 9) {
      setState(() {
        _result = "Invalid input! Enter a whole number (max 9 digits).";
      });
      return;
    } else {
      setState(() {
      _result = number % 2 == 0 ? "Even" : "Odd";
    });
    }

    
    

    // int? number = int.tryParse(_numberController.text);
    // if (number == null) {
    //   setState(() {
    //     _result = "Please enter a valid number";
    //   });
    // } else {
    //   setState(() {
    //     _result = number % 2 == 0 ? "Even" : "Odd";
    //   });
    // }
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
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
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
