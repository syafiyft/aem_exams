// lib/screens/login_form_screen.dart
import 'package:flutter/material.dart'; // This brings in all the Flutter widgets, like building blocks for our app.

class LoginFormScreen extends StatefulWidget {
  static const route = '/form'; // This is the name we use to go to this screen.
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() =>
      _LoginFormScreenState(); // This tells Flutter to use the _LoginFormScreenState for this screen.
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final _formKey = GlobalKey<
      FormState>(); // This is like a remote control to check if the form is filled out right.
  final _emailCtrl =
      TextEditingController(); // This helps us read what the user types in the email box.
  final _passwordCtrl =
      TextEditingController(); // This helps us read what the user types in the password box.

  static const int _minPasswordLength =
      6; // We want the password to be at least 6 letters long.

  @override
  void dispose() {
    _emailCtrl.dispose(); // Clean up when we're done with the screen.
    _passwordCtrl.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty)
      return 'Email can’t be empty'; // If the box is empty, show this message.
    if (!v.contains('@') || !v.contains('.'))
      return 'Enter a valid email'; // If it doesn't look like an email, show this message.
    return null; // If everything is okay, don't show any message.
  }

  String? _validatePassword(String? value) {
    final v = value ?? '';
    if (v.length < _minPasswordLength)
      return 'Password must be at least $_minPasswordLength characters'; // If the password is too short, show this message.
    return null; // If it's long enough, don't show any message.
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ??
        false; // Check if all the rules are followed.
    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Form Submitted'))); // If yes, show a message at the bottom.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login Form')), // The top bar with the title.
      body: Padding(
        padding: const EdgeInsets.all(16), // Add space around the form.
        child: Form(
          key: _formKey, // Connect the form to our remote control.
          autovalidateMode: AutovalidateMode
              .onUserInteraction, // Show errors as soon as the user types.
          child: Column(
            children: [
              TextFormField(
                controller: _emailCtrl, // This box is for the email.
                keyboardType: TextInputType
                    .emailAddress, // Show the right keyboard for emails.
                decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'you@example.com'), // Label and hint for the box.
                validator: _validateEmail, // Use our rule to check the email.
              ),
              const SizedBox(height: 12), // Add space between boxes.
              TextFormField(
                controller: _passwordCtrl, // This box is for the password.
                obscureText: true, // Hide what the user types (like dots).
                decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText:
                        'At least 6 characters'), // Label and hint for the box.
                validator:
                    _validatePassword, // Use our rule to check the password.
              ),
              const SizedBox(height: 20), // More space before the button.
              ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Submit')), // The button to check the form.
            ],
          ),
        ),
      ),
    );
  }
}
