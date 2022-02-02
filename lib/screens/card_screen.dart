import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  final String name;
  final String surname;
  final String? gender;
  final DateTime date;
  final String country;
  const CardScreen(
      this.name, this.surname, this.gender, this.date, this.country,
      {Key? key})
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ],
          ),
        ));
  }
}
