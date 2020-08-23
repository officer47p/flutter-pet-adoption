import "package:flutter/material.dart";
import './screens/home_screen.dart';

void main() {
  runApp(PetAdoption());
}

class PetAdoption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pet Adoption",
      home: HomeScreen(),
    );
  }
}
