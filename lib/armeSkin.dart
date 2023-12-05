import 'package:flutter/material.dart';

class ArmeSkin extends StatefulWidget {
  const ArmeSkin({super.key});

  @override
  State<ArmeSkin> createState() => _ArmeSkinState();
}

class _ArmeSkinState extends State<ArmeSkin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
    );
  }
}
