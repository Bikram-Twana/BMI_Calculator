import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";

  var bgColor = Colors.indigo.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        // ignore: prefer_const_constructors
        body: Container(
          color: bgColor,
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "BMI",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    controller: weightController,
                    decoration: const InputDecoration(
                      label: Text('Enter your Weight(in Kgs)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextField(
                    controller: feetController,
                    decoration: const InputDecoration(
                      label: Text('Enter your Height(in Feet)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextField(
                    controller: inchController,
                    decoration: const InputDecoration(
                      label: Text('Enter you Height(in Inch)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var weight = weightController.text.toString();
                        var feet = feetController.text.toString();
                        var inch = inchController.text.toString();

                        if (weight != "" && feet != "" && inch != "") {
                          //BMI Calculation
                          var intWeight = int.parse(weight);
                          var intFeet = int.parse(feet);
                          var intInch = int.parse(inch);

                          var totalInch = (intFeet * 12) + intInch;
                          var totalCm = totalInch * 2.54;
                          var totalMeter = totalCm / 100;

                          var bmi = intWeight / (totalMeter * totalMeter);

                          var msg = "";

                          if (bmi > 25) {
                            msg = "you are OverWeight!!";
                            bgColor = Colors.orange.shade400;
                          } else if (bmi < 18) {
                            msg = "Your are UnderWeight";
                            bgColor = Colors.red.shade400;
                          } else {
                            msg = "You are Healthy";
                            bgColor = Colors.green.shade400;
                          }

                          setState(() {
                            result =
                                "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks!!";
                          });
                        }
                      },
                      child: const Text('Calculate')),
                  const SizedBox(height: 9),
                  //output
                  Text(
                    result,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
