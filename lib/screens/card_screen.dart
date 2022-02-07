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
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromRGBO(225, 255, 255, 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          "$country Identification Card",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/image/person.png",
                              height: 175,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name: $name"),
                                  const SizedBox(height: 15),
                                  Text("Surname: $surname"),
                                  const SizedBox(height: 15),
                                  Text("Gender: $gender"),
                                  const SizedBox(height: 15),
                                  Text(
                                      "Birthday: ${date.day}-${date.month}-${date.year}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromRGBO(225, 255, 255, 1))
                ),
              ),
            ],
          ),
        ));
  }
}
