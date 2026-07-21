import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DiaperChangeScreen extends StatefulWidget {
  const DiaperChangeScreen({super.key});

  @override
  State<DiaperChangeScreen> createState() => _DiaperChangeScreenState();
}

class _DiaperChangeScreenState extends State<DiaperChangeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _isCleaned = false;
  bool _isRolledUp = false;
  bool _hasFreshDiaper = false;

  void _onWipeUsed() async {
    if (!_isCleaned) {
      setState(() {
        _isCleaned = true;
      });
      await _audioPlayer.play(AssetSource('audio/laugh_girl_sfx.mp3'));
    }
  }

  void _onDiaperRolled() {
    if (!_isRolledUp) {
      setState(() {
        _isRolledUp = true;
      });
    }
  }

  void _onDryDiaperPlaced() {
    if (_isCleaned && _isRolledUp) {
      setState(() {
        _hasFreshDiaper = true;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentEmotion = 'assets/characters_emotions/ruby_snow_crying_wet_diaper.png';
    if (_hasFreshDiaper) {
      currentEmotion = 'assets/characters_emotions/ruby_snow_happy.png';
    } else if (_isCleaned) {
      currentEmotion = 'assets/characters_emotions/ruby_snow.png';
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/changing_room_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(currentEmotion, height: 320),
          ),
          if (!_isCleaned)
            Positioned(
              top: 250,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: Image.asset('assets/props/rash.png', height: 80),
            ),
          Positioned(
            left: 20,
            bottom: 30,
            child: Row(
              children: [
                GestureDetector(
                  onTap: _onWipeUsed,
                  child: Image.asset('assets/props/wipes.png', height: 80),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: _onDiaperRolled,
                  child: Image.asset(
                    _isRolledUp
                        ? 'assets/diaper_assets/diaper_rolled_up.png'
                        : 'assets/props/wastebasket.png',
                    height: 80,
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: _onDryDiaperPlaced,
                  child: Image.asset('assets/diaper_assets/dry_diaper.png', height: 80),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
