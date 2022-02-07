import 'package:flutter/material.dart';

class FrontSideCard extends StatelessWidget {
  const FrontSideCard({
    Key? key,
    required this.country,
    required this.name,
    required this.surname,
    required this.date,
    required this.gender,
  }) : super(key: key);

  final String country;
  final String name;
  final String surname;
  final DateTime date;
  final String? gender;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$country Identification Card",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              children: [
                Flexible(child: Image.asset("assets/image/person.png")),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: $name"),
                      const SizedBox(height: 10),
                      Text("Surname: $surname"),
                      const SizedBox(height: 10),
                      Text(
                          "Birthday: ${date.day}-${date.month}-${date.year}"),
                      const SizedBox(height: 10),
                      Text("Gender: $gender"),
                      const SizedBox(height: 10),
                      Text("Country: $country"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        color: Colors.blue.shade100,
      ),
    );
  }
}
