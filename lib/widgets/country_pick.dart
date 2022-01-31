import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

class CountryPick extends StatelessWidget {
  const CountryPick({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryListPick(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          centerTitle: true,
          title: const Text(
            "Choose Your Country",
            style: TextStyle(color: Colors.black),
          ),
        ),
        theme: CountryTheme(
          isShowFlag: true,
          isShowTitle: true,
          isDownIcon: true,
          showEnglishName: true,
        ),
        initialSelection: 'US',
        onChanged: (CountryCode? code) {
          if (code != null) {

          }
        },
        useUiOverlay: true,
        useSafeArea: false);
  }
}
