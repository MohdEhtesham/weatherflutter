import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
  // Cast the argument to the appropriate type
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Center(child: Text("Hello")),
    );
  }
}