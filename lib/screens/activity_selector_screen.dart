import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'feed_screen.dart';
import 'diaper_change_screen.dart';
import 'playtime_screen.dart';
import 'bedtime_screen.dart';

class ActivitySelectorScreen extends StatelessWidget {
  const ActivitySelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/selector_background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildNavButton(
                    context,
                    'assets/baby_care_buttons/feed_button.png',
                    const FeedScreen(),
                    0,
                  ),
                  _buildNavButton(
                    context,
                    'assets/baby_care_buttons/diaper_change_button.png',
                    const DiaperChangeScreen(),
                    100,
                  ),
                  _buildNavButton(
                    context,
                    'assets/baby_care_buttons/playtime_button.png',
                    const PlaytimeScreen(),
                    200,
                  ),
                  _buildNavButton(
                    context,
                    'assets/baby_care_buttons/bedtime_button.png',
                    const BedtimeScreen(),
                    300,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(
      BuildContext context, String asset, Widget targetScreen, int delay) {
    return ZoomIn(
      delay: Duration(milliseconds: delay),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => targetScreen),
          );
        },
        child: Image.asset(asset),
      ),
    );
  }
}
