import 'package:flutter/material.dart';
import 'package:id_card_app/constants.dart';
import 'package:id_card_app/widgets/date_picker.dart';
import 'package:id_card_app/screens/card_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    const genderList = ["Male", "Female"];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "ID Card Creater",
                style: TextStyle(color: Colors.black),
              ),
            ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Enter your birthday:"),
                      SizedBox(width: 25,),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DatePicker(),
                        ),
                      ),
                    ],
                  ),
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
                                  return CardScreen(name, surname, gender);
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