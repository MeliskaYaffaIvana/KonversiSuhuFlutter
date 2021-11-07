import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.kelvin,
    required this.reamur,
  }) : super(key: key);

  final double kelvin;
  final double reamur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(children: [
          const Text(
            "Suhu Dalam Kelvin",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            kelvin.toStringAsFixed(5),
            style: const TextStyle(fontSize: 20),
          ),
        ]),
        Column(children: [
          const Text(
            "Suhu Dalam Reamur ",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            reamur.toStringAsFixed(5),
            style: const TextStyle(fontSize: 20),
          ),
        ]),
      ],
    );
  }
}
