import 'package:flutter/material.dart';

class LoginFormScreen extends StatefulWidget {
  static const route = '/form';
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  // Form key and controllers for managing form state
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  // Email validation logic
  String? _validateEmail(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Email can’t be empty';
    if (!v.contains('@') || !v.contains('.')) return 'Enter a valid email';
    return null;
  }

  // Password validation logic
  String? _validatePassword(String? value) {
    final v = value ?? '';
    if (v.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  // Handles form submission
  void _submit() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (ok) {
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
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              // Email input field
              TextFormField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'you@example.com',
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 12),
              // Password input field
              TextFormField(
                controller: _passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'At least 6 characters',
                ),
                validator: _validatePassword,
              ),
              const SizedBox(height: 20),
              // Submit button
              ElevatedButton(onPressed: _submit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
