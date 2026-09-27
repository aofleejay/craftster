import 'package:flutter/material.dart';

class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('A new version of the app is available.'),
            SizedBox(height: 16),
            Text('Please update to continue using the app.'),
          ],
        ),
      ),
    );
  }
}
