import 'package:bloc/bloc.dart'; // Using BLoC for state management
import 'ButtonState.dart';
import 'Failure.dart';

class ButtonBloc extends Cubit<ButtonState> {
  ButtonBloc() : super(ButtonState.idle); // Initial state is idle

  Future<void> simulateAsyncAction(int input) async {
    emit(ButtonState.loading);  // Set loading state
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate async work

      if (input == 1) {
        emit(ButtonState.success);  // Set success state
      } else {
        emit(ButtonState.failure);  // Set failure state
      }
    } catch (e) {
      emit(ButtonState.failure);  // Handle error
    }
  }
}
