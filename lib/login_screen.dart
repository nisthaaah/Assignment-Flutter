import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/google_signin.dart';
import 'package:login_screen/homePage.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 220.0, bottom: 120.0),
                child: Text(
                  'Login Page',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () async {
                  final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
                  await provider.googleLogin();
                  if (provider.isSignedIn) {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Colors.black54,
                      width: 1.2,
                    ),
                  ),
                  maximumSize:
                      MaterialStateProperty.all<Size>(const Size(350, 50)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      width: 30.0,
                      image: AssetImage('images/google.png'),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In with Google",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
