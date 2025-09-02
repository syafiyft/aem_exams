import 'package:flutter/material.dart';

class LoginFormScreen extends StatefulWidget {
  static const route = '/form'; // Route name for navigation
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  // --- State and Controllers ---
  final _formKey =
      GlobalKey<FormState>(); // Controls the form's validation state
  final _emailCtrl =
      TextEditingController(); // Lets you read/write the email field
  final _passwordCtrl =
      TextEditingController(); // Lets you read/write the password field

  @override
  void dispose() {
    // Clean up controllers when the widget is removed from the tree
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  // --- Validation Functions ---
  // Checks if the email is not empty and looks like an email
  String? _validateEmail(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Email can’t be empty';
    if (!v.contains('@') || !v.contains('.')) return 'Enter a valid email';
    return null; // null means valid
  }

  // Checks if the password is at least 6 characters
  String? _validatePassword(String? value) {
    final v = value ?? '';
    if (v.length < 6) return 'Password must be at least 6 characters';
    return null; // null means valid
  }

  // --- Submission Logic ---
  // Called when the user presses the submit button
  void _submit() {
    final ok =
        _formKey.currentState?.validate() ?? false; // Runs all validators
    if (ok) {
      // If all fields are valid, show a SnackBar
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Form Submitted')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey, // Connects the form to the key for validation
          autovalidateMode: AutovalidateMode
              .onUserInteraction, // Show errors as soon as user types
          child: Column(
            children: [
              // --- Email Field ---
              TextFormField(
                controller: _emailCtrl, // Connects the field to the controller
                keyboardType:
                    TextInputType.emailAddress, // Shows email keyboard
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'you@example.com',
                ),
                validator: _validateEmail, // Uses the email validator
              ),
              const SizedBox(height: 12),
              // --- Password Field ---
              TextFormField(
                controller:
                    _passwordCtrl, // Connects the field to the controller
                obscureText: true, // Hides the password as you type
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'At least 6 characters',
                ),
                validator: _validatePassword, // Uses the password validator
              ),
              const SizedBox(height: 20),
              // --- Submit Button ---
              ElevatedButton(onPressed: _submit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
// ---
// EXPLANATION:
// This screen is a login form. It uses a StatefulWidget because the form's state (input, errors) can change.
// - _formKey lets you check if all fields are valid at once.
// - _emailCtrl and _passwordCtrl let you read what the user typed.
// - _validateEmail and _validatePassword are functions that check if the input is correct.
// - When you press Submit, _submit() runs all validators. If everything is OK, it shows a SnackBar.
// - The UI is built with a Form, two TextFormFields, and a button.
