import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:journaling_app/Custom_Widgets/ButtonBloc.dart';
import 'package:journaling_app/Custom_Widgets/Button_Custom.dart';
import 'package:journaling_app/Custom_Widgets/TextFormField_Custom.dart';
import 'package:journaling_app/SignupScreen.dart';
import 'package:journaling_app/SplashScreen.dart';
import 'package:journaling_app/TextStyles/CustomTextStyles.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController username = TextEditingController();
  late TextEditingController password = TextEditingController();
  final ButtonBloc _buttonBloc = ButtonBloc();
  final ButtonBloc _googlebuttonBloc = ButtonBloc();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  // Google Sign-In handler
  Future<void> _handleGoogleSignIn() async {
    try {
      print("Attempting Google Sign-In...");
      // Attempt to sign in with Google
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print("Google User: $googleUser");

      if (googleUser != null) {
        // Step 2: Obtain the Google Sign-In authentication details
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        print("Google Auth: $googleAuth");

        // Step 3: Create a new Firebase credential using the Google access token and ID token
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        print("Firebase Credential: $credential");

        // Step 4: Sign in to Firebase with the credential
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        print("User Credential: $userCredential");

        // Step 5: Check if the user is successfully signed in
        User? user = userCredential.user;
        print("User: $user");

        if (user != null) {
          // Sign-in successful, proceed to the next screen
          print("Google Sign-In successful: ${user.displayName}");

          // You can now navigate to your home screen or other screens.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SplashScreen()), // Replace with your home screen
          );
        }
      } else {
        // User canceled the sign-in
        print("Google sign-in canceled");
      }
    } catch (error) {
      print("Google sign-in failed: $error");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Sign-In Error"),
          content: Text("Google sign-in failed. Please try again. Error: $error"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("OK")),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Colors.teal,
              Colors.yellowAccent,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      "Sign In",
                      style: CustomTextStyles.HeadingTextStyle(),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black, offset: Offset(0.0, 0.0), blurRadius: 5.0, spreadRadius: 1.0)],
                ),
                child: Center(
                  child: SizedBox(
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Image.asset('assets/images/Logo2.png')),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              TextFormField_Custom(
                                controller: username,
                                label: const Text("Enter Username or Email"),
                                hintText: "Hello",
                                error: const Icon(Icons.error),
                              ),
                              const SizedBox(height: 10),
                              TextFormField_Custom(
                                passwordField: true,
                                controller: password,
                                label: const Text("Enter password"),
                                errorText: "Password Field is mandatory",
                              ),
                              const SizedBox(height: 50),

                              // Use Button_Custom with Bloc
                              Button_Custom(
                                buttonBloc: _buttonBloc, // Passing the ButtonBloc instance
                                ButtonText: 'Sign In',
                                onPressed: () {
                                  // Trigger the action in the ButtonBloc
                                  _buttonBloc.simulateAsyncAction(1); // Simulate success or failure
                                },
                                width: double.infinity,
                                icon: Icons.install_desktop,
                                iconColor: Colors.white,
                              ),

                              SizedBox(height: 20,),
                              // Use Button_Custom with Bloc
                              Button_Custom(
                                buttonBloc: _googlebuttonBloc,  // Passing the ButtonBloc instance
                                ButtonText: 'Sign up with Google',
                                onPressed: () {
                                  // Trigger the action in the ButtonBloc
                                  _handleGoogleSignIn();
                                  _googlebuttonBloc.simulateAsyncAction(1); // Simulate success or failure
                                },
                                width: double.infinity,
                                imagePath: "assets/images/google_logo.png",
                                iconColor: Colors.white,
                              ),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  style: CustomTextStyles.MessageTextStyle(textColor: Colors.black), // Default style
                                  children: [
                                    TextSpan(text: "Don't have an account? "),
                                    WidgetSpan(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => SignupScreen()),
                                          );
                                        },
                                        child: Text(
                                          "Register here!",
                                          style: CustomTextStyles.MessageTextStyle(textColor: Colors.blueAccent), // Apply blue color to the second part
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    _buttonBloc.close();  // Close the Bloc when the screen is disposed
    _googlebuttonBloc.close();
    super.dispose();
  }
}
