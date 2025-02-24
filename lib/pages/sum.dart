import 'package:flutter/material.dart';

class Sum extends StatefulWidget {
  const Sum({Key? key}) : super(key: key);

  @override
  _SumState createState() => _SumState();
}

class _SumState extends State<Sum> {
  final TextEditingController _controller = TextEditingController();
  double totalSum = 0.0;
  int digitCount = 0;

  void calculateSum() {
    String inputText = _controller.text;

    // Extract numbers from input using regex
    List<String> numbers = RegExp(r'[-+]?\d*\.?\d+')
        .allMatches(inputText)
        .map((match) => match.group(0)!)
        .toList();

    digitCount = RegExp(r'\d').allMatches(inputText).length;

    if (numbers.isEmpty) {
    setState(() {
      totalSum = 0.0; 
    });
    return; 
  }

    // Convert numbers to double and sum them up
    double sum = numbers.map((num) => double.tryParse(num) ?? 0).reduce((a, b) => a + b);

    setState(() {
      totalSum = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jumlah Total Angka"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(251, 180, 72, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Masukkan Data (angka dan teks):",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Contoh: 10, abc, 20.5, xyz, -3",
              ),
              onChanged: (value) => calculateSum(), // Auto update sum
            ),
            const SizedBox(height: 20),
            Text(
              "Total Jumlah Angka: $totalSum",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromRGBO(251, 180, 72, 1),),
            ),
            const SizedBox(height: 20),
            Text(
              "Jumlah Digit Angka: $digitCount",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromRGBO(251, 180, 72, 1),),
            ),
          ],
        ),
      ),
    );
  }
}
