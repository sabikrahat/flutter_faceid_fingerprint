import 'package:flutter/material.dart';
import '../../config/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: mainCenter,
          children: <Widget>[
            Text(appName),
          ],
        ),
      ),
    );
  }
}
