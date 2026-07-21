import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String _babyEmotion = 'assets/characters_emotions/ruby_snow.png';

  void _feedBaby(String foodAsset) async {
    if (foodAsset.contains('lemons')) {
      setState(() {
        _babyEmotion = 'assets/characters_emotions/ruby_snow_crying_wet_diaper.png';
      });
      await _audioPlayer.play(AssetSource('audio/baby_crying_sfx.mp3'));
    } else {
      setState(() {
        _babyEmotion = 'assets/characters_emotions/ruby_snow_happy.png';
      });
      await _audioPlayer.play(AssetSource('audio/laugh_girl_sfx.mp3'));
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> foods = [
      'assets/foods/baby_bottle_nuk_of_milk.png',
      'assets/foods/baby_food_guacamole_bowl.png',
      'assets/foods/buldak_cheese_noodles_bowl.png',
      'assets/foods/lemons_on_plate.png',
    ];

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/kitchen_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(_babyEmotion, height: 300),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 100,
              color: Colors.white54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: foods.map((food) {
                  return Draggable<String>(
                    data: food,
                    feedback: Image.asset(food, height: 80),
                    childWhenDragging: Opacity(
                      opacity: 0.3,
                      child: Image.asset(food, height: 80),
                    ),
                    child: DragTarget<String>(
                      onAcceptWithDetails: (details) => _feedBaby(details.data),
                      builder: (context, candidateData, rejectedData) {
                        return Image.asset(food, height: 80);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
