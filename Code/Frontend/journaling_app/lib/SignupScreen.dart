import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_Widgets/ButtonBloc.dart';
import 'Custom_Widgets/Button_Custom.dart';
import 'Custom_Widgets/TextFormField_Custom.dart';
import 'LoginScreen.dart';
import 'TextStyles/CustomTextStyles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController username = TextEditingController();
  late TextEditingController password = TextEditingController();
  final ButtonBloc _createAccountButtonBloc = ButtonBloc();

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
                      "Sign Up",
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
                                buttonBloc: _createAccountButtonBloc, // Passing the ButtonBloc instance
                                ButtonText: 'Sign Up',
                                onPressed: () {
                                  // Trigger the action in the ButtonBloc
                                  _createAccountButtonBloc.simulateAsyncAction(1); // Simulate success or failure
                                },
                                width: double.infinity,
                                icon: Icons.install_desktop,
                                iconColor: Colors.white,
                              ),

                              SizedBox(height: 20,),
                              SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: "Already have an account? ", style: CustomTextStyles.MessageTextStyle(textColor: Colors.black)),
                                    WidgetSpan(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => LoginScreen()),
                                          );
                                        },
                                        child: Text(
                                          "Login here!",
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
    _createAccountButtonBloc.close();  // Close the Bloc when the screen is disposed
    super.dispose();
  }
}
