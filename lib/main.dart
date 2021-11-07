import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_design_towidget_flutter/input.dart';
import 'package:konversi_design_towidget_flutter/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();
  double inputUser = 0;
  double kelvin = 0;
  double farenheit = 0;
  double reamur = 0;
  double input = 0;

  konversiSuhu() {
    setState(() {
      inputUser = double.parse(etInput.text);
      kelvin = inputUser + 273;
      reamur = inputUser * 4 / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konversi Suhu"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Input(etInput: etInput),
            const SizedBox(
              height: 200,
            ),
            Result(kelvin: kelvin, reamur: reamur),
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.only(top: 30),
              child: RaisedButton(
                onPressed: konversiSuhu,
                textColor: Colors.white,
                color: Colors.lightBlue,
                child: const Text("Konversi Suhu"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
