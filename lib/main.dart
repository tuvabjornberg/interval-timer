import 'package:flutter/material.dart';
import 'dart:async';
import 'package:numberpicker/numberpicker.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 232, 152, 177),
          fontFamily: 'StratfordRegular'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Interval Timer'),
          backgroundColor: Color.fromARGB(255, 236, 171, 192),
        ),
        body: TabBarView(
          children: [
            _IntegerExample(),
          ],
        ),
      ),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentValueMinActive = 0;
  int _currentValueSecActive = 0;
  int _currentValueMinRest = 0;
  int _currentValueSecRest = 0;

  final player = AudioPlayer();

  void _incrementCounter() {
    print('Timer start 3 seconds');
    Timer(const Duration(seconds: 3), handleTimeout);
  }

  void handleTimeout() async {
    await player.play(AssetSource('audio/record_out.wav'));
    print('TIME OUT!');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Active:'),
            NumberPicker(
              value: _currentValueMinActive,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) =>
                  setState(() => _currentValueMinActive = value),
            ),
            const Text('min'),
            NumberPicker(
              value: _currentValueSecActive,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) =>
                  setState(() => _currentValueSecActive = value),
            ),
            const Text('s'),
          ],
        ),
        Text(
            'Current active: $_currentValueMinActive minutes $_currentValueSecActive seconds'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Rest:'),
            NumberPicker(
              value: _currentValueMinRest,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) =>
                  setState(() => _currentValueMinRest = value),
            ),
            const Text('min'),
            NumberPicker(
              value: _currentValueSecRest,
              minValue: 0,
              maxValue: 60,
              onChanged: (value) =>
                  setState(() => _currentValueSecRest = value),
            ),
            const Text('s'),
          ],
        ),
        Text(
            'Current rest: $_currentValueMinRest minutes $_currentValueSecRest seconds'),
        FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 234, 195, 122),
          onPressed: () {
            _incrementCounter();
          },
          child: const Icon(Icons.timer),
        )
      ],
    );
  }
}
