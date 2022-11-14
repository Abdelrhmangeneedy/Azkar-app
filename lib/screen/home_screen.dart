//   ignore_for_file:   unnecessary_string_escapes

import 'package:azkar/screen/ahadeth_screen.dart';
import 'package:azkar/screen/azkar_screen.dart';
import 'package:azkar/screen/sebha_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(93, 76, 60, 1),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: SizedBox(
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SebhaScreen(),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/elseb7a.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AzkarScreen(),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/2zkar.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AhadethScreen(),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/a7adeth.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                  "Created   by   Metwally   &   geneedy.   All   rights   reserved",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 242, 206),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
