import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_design_towidget_flutter/input.dart';
import 'package:konversi_design_towidget_flutter/result.dart';
import 'package:konversi_design_towidget_flutter/riwayat.dart';

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
  double fahrenheit = 0;
  double reamur = 0;
  double input = 0;
  String? _newValue = "Kelvin";
  double result = 0;

  konversiSuhu() {
    setState(() {
      inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin") {
        result = inputUser + 273;
        listViewItem.insert(0, "Kelvin : " + result.toStringAsFixed(1));
      } else if (_newValue == "Reamur") {
        result = inputUser * 4 / 5;
        listViewItem.insert(0, "Reamur : " + result.toStringAsFixed(1));
      } else {
        result = inputUser * 9 / 5 + 32;
        listViewItem.insert(0, "Fahrenheit : " + result.toStringAsFixed(1));
      }
    });
  }

  var listItem = ["Kelvin", "Reamur", "fahrenheit"];
  List<String> listViewItem = [];

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
            DropdownButton<String>(
              items: listItem.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: _newValue,
              onChanged: (changeValue) {
                changeDropdownValue(changeValue);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Result(result: result)],
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.lightBlueAccent,
              child: MaterialButton(
                onPressed: konversiSuhu,
                textColor: Colors.white,
                color: Colors.lightBlue,
                child: const Text("Konversi Suhu"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(child: RiwayatKonversi(listViewItem: listViewItem))
          ],
        ),
      ),
    );
  }

  void changeDropdownValue(changeValue) {
    setState(() {
      _newValue = changeValue;
      konversiSuhu();
    });
  }
}
