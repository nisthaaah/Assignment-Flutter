import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'google_signin.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final googleSignInProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Home Page!'),
            const SizedBox(height: 20),
            Consumer<GoogleSignInProvider>(
              builder: (context, provider, child) {
                if (provider.isSignedIn) {
                  final user = provider.user;
                  return Column(
                    children: [
                      Text(
                        'User Information:',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Text(
                        'Name: ${user.displayName}',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Email: ${user.email}',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // Add more user information as needed
                    ],
                  );
                } else {
                  return const Text('User not signed in.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
