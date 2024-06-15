import 'package:aaa/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Logo
                  Image.asset(
                    'images/mri.png', // Replace with your logo image
                    height: 150,
                  ),
                  const SizedBox(height: 32),

                  // Email TextField
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password TextField
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  // Login Button
                  ElevatedButton(
                    /*style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                    ),*/
                    onPressed: () {
                      /*if (_formKey.currentState!.validate()) {
                        // Process login
                        // ...
                      }*/
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const HomeScreen(), // Replace with your second screen
                        ),
                        (route) => false,
                      );
                    },
                    /*style: ElevatedButton.styleFrom(
                      */ /*backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),*/ /*
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),*/
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  //SizedBox(height: 16),

                  // Forgot Password
                  /*TextButton(
                    onPressed: () {
                      // Navigate to forgot password screen
                      // ...
                    },
                    child: Text('Forgot Password?',
                        style: TextStyle(color: Colors.blue)),
                  ),
                  SizedBox(height: 16),

                  // Create Account
                  TextButton(
                    onPressed: () {
                      // Navigate to create account screen
                      // ...
                    },
                    child: Text('Create Account',
                        style: TextStyle(color: Colors.blue)),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
