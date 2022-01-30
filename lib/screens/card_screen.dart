import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  final String name;
  final String surname;
  final String? gender;
  const CardScreen(this.name, this.surname, this.gender, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name),
          Text(surname),
          Text(gender!),
        ],
      ),
    ));
  }
}
