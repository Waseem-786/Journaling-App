import 'package:flutter/material.dart';
import 'package:journaling_app/Custom_Widgets/ButtonBloc.dart';
import 'package:journaling_app/Custom_Widgets/Button_Custom.dart';
import 'package:journaling_app/Custom_Widgets/TextFormField_Custom.dart';
import 'package:journaling_app/TextStyles/CustomTextStyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController username = TextEditingController();
  late TextEditingController password = TextEditingController();
  final ButtonBloc _buttonBloc = ButtonBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey,
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Login", style: CustomTextStyles.HeadingTextStyle()),
                const SizedBox(height: 20),
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
                  errorText: "Hi",
                ),
                const SizedBox(height: 20),

                // Use Button_Custom with Bloc
                Button_Custom(
                  buttonBloc: _buttonBloc,  // Passing the ButtonBloc instance
                  ButtonText: 'Sign In',
                  onPressed: () {
                    // Trigger the action in the ButtonBloc
                    _buttonBloc.simulateAsyncAction(1); // Simulate success or failure
                  },
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    username.dispose();
    _buttonBloc.close();  // Close the Bloc when the screen is disposed
    super.dispose();
  }
}
