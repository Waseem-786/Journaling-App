import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journaling_app/TextStyles/CustomTextStyles.dart';
import 'ButtonState.dart';
import 'ButtonBloc.dart';  // Import the ButtonBloc

class Button_Custom extends StatelessWidget {
  final ButtonBloc buttonBloc;  // Pass the Bloc for state management
  final VoidCallback onPressed;
  final String ButtonText;
  final double? width;
  final IconData? icon;  // IconData for the icon
  final String? imagePath;  // Image path for the logo
  final Color? iconColor;

  Button_Custom({
    required this.buttonBloc,
    required this.onPressed,
    required this.ButtonText,
    this.width,
    this.icon,  // Accept IconData
    this.imagePath,  // Accept image path
    this.iconColor,
  });

  final BorderRadius _borderRadius = BorderRadius.circular(22.0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      bloc: buttonBloc,  // Listening to ButtonBloc state changes
      builder: (context, state) {
        return Container(
          width: width ?? double.infinity,
          height: 56.0,
          decoration: BoxDecoration(
            color: _getColorBasedOnState(state),
            borderRadius: _borderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // If imagePath is provided, show the image; otherwise, show Icon
              imagePath != null
                  ? Image.asset(imagePath!, width: 35, height: 35)  // Load image
                  : icon != null
                  ? Icon(icon, color: iconColor, size: 30)  // Show icon if provided
                  : const SizedBox.shrink(),  // Empty space if neither icon nor image is provided
              SizedBox(width: 10),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onPressed,
                  borderRadius: _borderRadius,
                  child: Center(
                    child: state == ButtonState.loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                      ButtonText,
                      style: CustomTextStyles.ButtonTextStyle(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper function to change color based on state
  Color _getColorBasedOnState(ButtonState state) {
    switch (state) {
      case ButtonState.success:
        return Colors.green;
      case ButtonState.failure:
        return Colors.red;
      case ButtonState.loading:
        return Colors.blue;
      default:
        return Colors.black;  // Default color for idle state
    }
  }
}
