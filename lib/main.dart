import 'package:cinnamon_riverpod_2/firebase_options.dart';
import 'package:cinnamon_riverpod_2/routing/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await _prepareApp();

  runApp(
    const ProviderScope(
      child: TripFinder(),
    ),
  );
}

Future<void> _prepareApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class TripFinder extends StatelessWidget {
  const TripFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trip Finder',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
