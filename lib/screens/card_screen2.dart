import 'package:flutter/material.dart';
import 'package:id_card_app/widgets/front_side_cart.dart';

class CardScreen2 extends StatelessWidget {
  final String name;
  final String surname;
  final String? gender;
  final DateTime date;
  final String country;
  const CardScreen2(
      this.name, this.surname, this.gender, this.date, this.country,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: size.width*0.95,
                  child: FrontSideCard(
                      country: country,
                      name: name,
                      surname: surname,
                      date: date,
                      gender: gender),
                ),
              ),
              Center(
                child: SizedBox(
                  width: size.width*0.95,
                  child: FrontSideCard(
                      country: country,
                      name: name,
                      surname: surname,
                      date: date,
                      gender: gender),
                ),
              ),
        
              // Expanded(
              //   child: Card(
              //     child: Image.asset("assets/image/person.png"),
              //     color: Colors.black26,
              //   ),
              // ),
            ],
          ),
        ));
  }
}
