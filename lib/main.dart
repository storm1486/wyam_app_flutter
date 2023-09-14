import 'package:flutter/material.dart';
import 'package:wyam_app/pages/home.dart';
import 'package:wyam_app/services/bottomNavigator.dart';

void main() => runApp(MaterialApp(
 initialRoute: '/',
 routes: {
  '/': (context) => const BottomNavigator(),
  '/home': (context) => const Home(),
  // '/location': (context) => const ChooseLocation(),
 },
));