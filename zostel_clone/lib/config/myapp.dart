import 'dart:developer';

import 'package:flutter/material.dart';

import '../src/auth/data/auth_manager.dart';
import '../src/home/presentation/home_screen.dart';

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
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                await onLogin(context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 40),
              ),
              child: Text("Login".toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onLogin(BuildContext context) async {
    await AuthManager().acquireToken().then(
      (token) {
        log("accessToken: ${token?.accessToken}");
        if (context.mounted) {
          token != null && token.accessToken.isNotEmpty
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(title: token.displayName),
                  ),
                )
              : {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      dividerColor: Colors.red,
                      content: const Text("Error Logging In. Try Again"),
                      actions: [
                        TextButton(
                          onPressed: () => ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner(),
                          child: const Text("Dismiss"),
                        ),
                      ],
                    ),
                  )
                };
        }
      },
    );
  }
}
