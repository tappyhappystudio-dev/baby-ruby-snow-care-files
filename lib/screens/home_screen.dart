import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'activity_selector_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/home_screen_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BounceInDown(
                  child: Image.asset(
                    'assets/logos_and_buttons/logo.png',
                    height: 180,
                  ),
                ),
                const SizedBox(height: 30),
                Pulse(
                  infinite: true,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ActivitySelectorScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/logos_and_buttons/play_button.png',
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
