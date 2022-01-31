import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  final String name;
  final String surname;
  final String? gender;
  final DateTime date;
  const CardScreen(this.name, this.surname, this.gender, this.date, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          title: const Text(
            "Your ID Card",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              Text(surname),
              Text(gender!),
              Text(date.year.toString()),
            ],
          ),
        ));
  }
}
