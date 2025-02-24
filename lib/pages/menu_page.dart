import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas1/main.dart';
import 'package:tugas1/pages/kalkulator_page.dart';
import 'package:tugas1/pages/odd_even_page.dart';
import 'package:tugas1/pages/sum.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Color.fromRGBO(251, 180, 72, 1),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        alignment: Alignment.topCenter,
        color: Colors.grey[100], // Light background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sum()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(251, 180, 72, 1),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Sum',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KalkulatorPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(251, 180, 72, 1),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Calculator',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OddEvenPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(251, 180, 72, 1),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Odd / Even',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(251, 180, 72, 1),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Logout',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
