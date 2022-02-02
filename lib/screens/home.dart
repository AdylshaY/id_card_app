import 'package:flutter/material.dart';
import 'package:id_card_app/constants.dart';
import 'package:id_card_app/screens/card_screen.dart';
import 'package:id_card_app/widgets/country_pick.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? gender;

  DateTime date = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const genderList = ["Male", "Female"];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          title: const Text(
            "ID Card Creater",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: myController,
                      decoration: const InputDecoration(
                          hintText: "Name",
                          prefixIcon:
                              Icon(Icons.people_rounded, color: Colors.black),
                          border: outlineInputBorder,
                          focusedBorder: outlineInputBorderFocused),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: myController2,
                      decoration: const InputDecoration(
                          hintText: "Surname",
                          prefixIcon:
                              Icon(Icons.people_rounded, color: Colors.black),
                          border: outlineInputBorder,
                          focusedBorder: outlineInputBorderFocused),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your surname";
                        }
                        return null;
                      },
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text("Choose Your Birthday"),
                        onPressed: () {
                          selectTimePicker(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Your birthday: ${date.day.toString()}-${date.month.toString()}-${date.year.toString()}"),
                      ),
                    ],
                  ),
                  CountryPick(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Gender: "),
                        const SizedBox(
                          width: 25,
                        ),
                        DropdownButton<String>(
                          value: gender,
                          items: genderList
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          child: const Text("Clear"),
                          onPressed: () {
                            setState(() {
                              myController.text = "";
                              myController2.text = "";
                              gender = null;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          child: const Text("Create"),
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                gender != null) {
                              String name = myController.text;
                              String surname = myController2.text;
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return CardScreen(
                                      name, surname, gender, date, CountryPick.country!);
                                },
                              ));
                            } else if (_formKey.currentState!.validate() &&
                                gender == null) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      content: Text("Select your gender"),
                                    );
                                  });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}


