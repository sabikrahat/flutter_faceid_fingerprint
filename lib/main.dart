import 'package:flutter/material.dart';
import 'config/get_platform.dart';
import 'modules/home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shared/local_auth/view/local_auth.dart';

void main() async {
  await _init();
  runApp(const ProviderScope(child: App()));
}

Future<void> _init() async {
  pt = PlatformInfo.getCurrentPlatformType();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LocalAuthWidget(child: HomeView()),
    );
  }
}
