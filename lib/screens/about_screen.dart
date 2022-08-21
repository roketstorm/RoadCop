import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'RoadCop',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Arcade',
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Made by RoketStorm',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Special for Midyear 2022 Flame Game Jam',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Graphics: RoketStorm',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Programming: RoketStorm',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Sfx: RoketStorm',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Music: RoketStorm',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Fonts:',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const Text(
                '"Alarm Clock" by David J Patterson',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const Text(
                '"Pointless" by LukeMans',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const Text(
                '"Arcade" by Yuji Adachi',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'github.com/roketstorm',
                style: TextStyle(
                  color: Color.fromRGBO(0, 200, 0, 1.0),
                  fontFamily: 'Pointless',
                  fontSize: 16,
                  shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  '<< Go back',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 200, 0, 1.0),
                    fontFamily: 'Pointless',
                    fontSize: 16,
                    shadows: [Shadow(offset: Offset(5, 5), blurRadius: 0.0)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
