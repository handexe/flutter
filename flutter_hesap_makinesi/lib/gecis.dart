import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hesap_makinesi/home.dart';

class gecis extends StatefulWidget {
  const gecis({super.key});

  @override
  State<gecis> createState() => _gecisState();
}

class _gecisState extends State<gecis> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=> const Home(),
      ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurpleAccent[100],
        child:  const Center(
          child: Text("Hesapla", style: TextStyle(
            fontSize: 40,
            color: Colors.black
          ),),
        )
      ),
    );
  }
}
