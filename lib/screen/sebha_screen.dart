import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/elseb7a-page.png',
                ),
                fit: BoxFit.fill)),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 280.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$count",
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.black87,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        width: 120,
                        child: FloatingActionButton.extended(
                            backgroundColor:
                                const Color.fromARGB(93, 76, 60, 1),
                            onPressed: () {
                              setState(() {
                                count = 0;
                              });
                            },
                            label: const Text('اعاده',
                                style: TextStyle(
                                  fontSize: 30,
                                )),
                            icon: const Icon(
                              Icons.refresh,
                              size: 30,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: FloatingActionButton.extended(
                        backgroundColor: const Color.fromARGB(255, 58, 48, 45),
                        onPressed: () {
                          setState(() {
                            count = count + 1;
                          });
                          BoxShape.circle;
                        },
                        label: const Text(
                          'سبح   اطال   الله   عمرك',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
