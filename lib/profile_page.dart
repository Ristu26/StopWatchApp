import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  bool flag = true;
  late Function nameSetState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 130, bottom: 20),
              child: Image.asset(
                'lib/assets/my_image.png',
                height: 150,
                width: 150,
              ),
            ),
            StatefulBuilder(
              builder: (
                BuildContext context,
                void Function(void Function()) setState,
              ) {
                nameSetState = setState;
                return Text(
                  'Name : Dip Chakraborty',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: flag
                        ? Color.fromARGB(255, 6, 0, 91)
                        : Color.fromARGB(255, 129, 1, 77),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Email Id : dip36cse@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 6, 0, 91),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contact No. : 9749472559',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 6, 0, 91),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Address : Chakdaha,Nadia',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 6, 0, 91),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            ),
            ElevatedButton(
              onPressed: () {
                nameSetState(() {
                  flag = !flag;
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 1, 90, 153),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
              child: Text(
                'Click Me',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Image.asset(
              'lib/assets/sample.png',
              height: 295,
              width: 450,
            ),
          ],
        ),
      ),
    );
  }
}
