import 'package:equatable/equatable.dart';

// Base Failure class
abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];

  // Default error message for failures
  String get errorMessage => 'An unexpected error occurred.';
}

// Specific failure example
class DefaultFailure extends Failure {
  @override
  String get errorMessage => 'Default failure occurred.';
}