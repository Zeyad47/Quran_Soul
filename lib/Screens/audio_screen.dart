import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Audio done by Izwan'),
        ),
      ),
    );
  }
}
