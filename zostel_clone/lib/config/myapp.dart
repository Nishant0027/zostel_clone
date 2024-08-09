import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zostel/src/auth/data/auth_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      // home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final msalAuth = await AuthManager().authClient();
            try {
              final user = await msalAuth.acquireToken();

              // log('User data: ${user?.toJson()}');

              final accessToken = user?.accessToken;
              log("accessToken: $accessToken");

              final tokenExpiresOn = user?.tokenExpiresOn;
              log("TOken Expires On: $tokenExpiresOn");
            } catch (e) {
              debugPrint("Error fetching token: $e");
            }
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 40),
          ),
          child: const Text("Login"),
        ),
      ),
    );
  }
}
