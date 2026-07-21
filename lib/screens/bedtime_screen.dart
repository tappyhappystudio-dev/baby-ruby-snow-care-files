import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class BedtimeScreen extends StatefulWidget {
  const BedtimeScreen({super.key});

  @override
  State<BedtimeScreen> createState() => _BedtimeScreenState();
}

class _BedtimeScreenState extends State<BedtimeScreen> {
  final AudioPlayer _musicPlayer = AudioPlayer();
  bool _isPlayingLullaby = false;
  bool _hasBlanket = false;

  void _toggleLullaby() async {
    if (_isPlayingLullaby) {
      await _musicPlayer.stop();
      setState(() => _isPlayingLullaby = false);
    } else {
      await _musicPlayer.play(AssetSource('audio/this_old_man_the_green_orbs.mp3'));
      setState(() => _isPlayingLullaby = true);
    }
  }

  void _toggleBlanket() {
    setState(() {
      _hasBlanket = !_hasBlanket;
    });
  }

  @override
  void dispose() {
    _musicPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String babyEmotion = (_isPlayingLullaby && _hasBlanket)
        ? 'assets/characters_emotions/ruby_snow_sleeping.png'
        : 'assets/characters_emotions/ruby_snow.png';

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/bedroom_crib_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(babyEmotion, height: 280),
          ),
          if (_hasBlanket)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Image.asset('assets/props/blanket.png', height: 180),
              ),
            ),
          Positioned(
            bottom: 30,
            left: 50,
            child: GestureDetector(
              onTap: _toggleLullaby,
              child: Image.asset('assets/props/radio.png', height: 80),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 50,
            child: GestureDetector(
              onTap: _toggleBlanket,
              child: Image.asset('assets/props/blanket.png', height: 80),
            ),
          ),
        ],
      ),
    );
  }
}
