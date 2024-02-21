import 'package:flutter/material.dart';

class FormValScreen extends StatelessWidget {
  FormValScreen({super.key});
  final _form = GlobalKey<FormState>();

  void _submit() {
    final isValid = _form.currentState!.validate();

    if(!isValid) {
      return;
    }
    _form.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 22,
        ),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Invalid Email';
                  }
                  return null;
                },
                enableSuggestions: false,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Invalid Password';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
