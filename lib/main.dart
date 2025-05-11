import 'package:flutter/material.dart';
import 'package:auto_updater/auto_updater.dart';

void main() async {
  // Ensure widgets are bound before running async code
  WidgetsFlutterBinding.ensureInitialized();

  // Your GitHub-hosted appcast.xml URL
  String feedURL =
      'https://raw.githubusercontent.com/sjgod1427/demo_auto_updater/main/dist/appcast.xml';

  // Set feed URL
  await autoUpdater.setFeedURL(feedURL);

  // Set how often to check (in seconds)
  await autoUpdater.setScheduledCheckInterval(3600); // 1 hour

  // Check for updates at startup
  await autoUpdater.checkForUpdates();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auto Updater',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _manuallyCheckForUpdates() async {
    await autoUpdater.checkForUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auto Updater Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: _manuallyCheckForUpdates,
          child: const Text('Check for Updates'),
        ),
      ),
    );
  }
}
