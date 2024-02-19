// lib/screens/input_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController systolicController = TextEditingController();
  final TextEditingController diastolicController = TextEditingController();

  InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blood Pressure',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor:
            const Color(0xFFE8AD76), // Customize the app bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(15), // Adjust the radius as needed
                child: Image.asset(
                  'assets/heart2.jpg',
                  fit: BoxFit.cover,
                  width: 300,
                  height: 200,
                ),
              ),

              const SizedBox(height: 100), // space between

              Container(
                height: 100,
                width: 400,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 178, 203, 232),
                    Color.fromARGB(255, 245, 138, 140),
                  ]),
                ),
                child: TextFormField(
                  controller: systolicController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(labelText: 'Systolic'),
                ),
              ),

              const SizedBox(height: 10), // space beetween

              Container(
                height: 100,
                width: 400,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 178, 203, 232),
                    Color.fromARGB(255, 245, 138, 140),
                  ]),
                ),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 40, color: Color.fromARGB(255, 189, 62, 62)),
                  controller: diastolicController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Diastolic',
                  ),
                ),
              ),

              const SizedBox(height: 20), // space between

              ElevatedButton(
                onPressed: () => validateAndNavigate(),
                style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(174, 23, 18, 18),
                    elevation: 8,
                    backgroundColor:
                        const Color.fromRGBO(162, 225, 242, 0.914)),
                child: const Text(
                  'Validate',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomAppBar(
          color: const Color.fromARGB(255, 236, 171, 118),
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.search), // bottom icon left
                color: const Color.fromARGB(255, 0, 0, 0),
                iconSize: 40,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.home_outlined), // bottom icon right
                color: const Color.fromARGB(255, 0, 0, 0),
                iconSize: 40,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndNavigate() {
    int systolic = int.tryParse(systolicController.text) ?? 0;
    int diastolic = int.tryParse(diastolicController.text) ?? 0;

    if (systolic <= 0 || diastolic <= 0) {
      Get.dialog(
        AlertDialog(
          title: const Text(
            'Invalid Data',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: const Text('Please enter valid blood pressure values.'),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('OK'),
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(200, 162, 245, 0.686)),
            ),
          ],
        ),
      );
    } else {
      Get.to(() => InfoScreen(systolic: systolic, diastolic: diastolic));
    }
  }
}

class InfoScreen extends StatelessWidget {
  final int systolic;
  final int diastolic;

  InfoScreen({required this.systolic, required this.diastolic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blood Pressure Info ',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(
            255, 128, 233, 246), // Customize the app bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200,
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/heart2.jpg'),
              ),

              const SizedBox(height: 5), // space between

              Container(
                  height: 100,
                  width: 200,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 154, 163, 230)),
                  child: Center(
                      child: Text(
                    'Systolic: $systolic',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ))),

              Container(
                  height: 100,
                  width: 200,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 10,
                            color: Color.fromRGBO(44, 28, 29, 0.612),
                            blurStyle: BlurStyle.inner,
                            spreadRadius: 2,
                            offset: Offset(3, 6)),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 154, 163, 230)),
                  child: Center(
                      child: Text(
                    'Diastolic: $diastolic',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ))),

              const SizedBox(height: 10), // space between

              Container(
                  height: 90,
                  width: 320,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 185, 168, 168),
                        blurRadius: 10,
                        blurStyle: BlurStyle.inner,
                        spreadRadius: 2,
                        offset: Offset(4, 7), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(48),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 237, 154, 86),
                      Color.fromARGB(255, 227, 106, 108),
                    ]),
                  ), //color: const Color.fromARGB(255, 241, 100, 68)),
                  child: Center(
                      child: Text(
                    ' ${classifyBloodPressure()}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ))),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomAppBar(
          color: const Color.fromARGB(255, 236, 171, 118),
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.search), // bottom icon left
                color: const Color.fromARGB(255, 0, 0, 0),
                iconSize: 40,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.home_outlined), // bottom icon right
                color: const Color.fromARGB(255, 0, 0, 0),
                iconSize: 40,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.history), // bottom icon left
                color: const Color.fromARGB(255, 0, 0, 0),
                iconSize: 40,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  String classifyBloodPressure() {
    // Implement your blood pressure classification logic here
    // Example logic, modify as needed
    if (systolic < 90 || diastolic < 60) {
      return 'Low';
    } else if (systolic < 120 && diastolic < 80) {
      return 'Normal';
    } else if (systolic < 130 && diastolic < 80) {
      return 'Elevated';
    } else if (systolic < 140 || diastolic < 90) {
      return 'Hypertension Stage 1';
    } else if (systolic < 160 || diastolic < 100) {
      return 'Hypertension Stage 2';
    } else {
      return 'Hypertensive Crisis';
    }
  }
}
