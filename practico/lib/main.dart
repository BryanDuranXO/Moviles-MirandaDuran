import 'package:flutter/material.dart';
import 'package:practico/branch_map_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BranchMapPage(),
    );
  }
}