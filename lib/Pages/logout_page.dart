import 'package:flutter/material.dart';
import 'package:plypicker_flutter/Pages/Auth/login_page.dart';
import 'package:plypicker_flutter/Provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Logout", style: TextStyle(fontSize: 30)),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationProvider>().signOut();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
                
              },
              child: const Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
