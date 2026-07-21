import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PlaytimeScreen extends StatefulWidget {
  const PlaytimeScreen({super.key});

  @override
  State<PlaytimeScreen> createState() => _PlaytimeScreenState();
}

class _PlaytimeScreenState extends State<PlaytimeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playWithToy() async {
    await _audioPlayer.play(AssetSource('audio/laugh_girl_sfx.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> toys = [
      'assets/toys/ball.png',
      'assets/toys/rattle.png',
      'assets/toys/drum.png',
      'assets/toys/trumpet.png',
    ];

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/playroom_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/characters_emotions/ruby_snow_happy.png',
              height: 300,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 40,
            right: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: toys.map((toy) {
                return GestureDetector(
                  onTap: _playWithToy,
                  child: Image.asset(toy, height: 75),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
