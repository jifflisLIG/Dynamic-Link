import 'package:dynamic_link/profile.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/profile': (context) => Profile(),
        '/login': (context) => LoginPage(),
      })
  );
}
