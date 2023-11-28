// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/ui/home_page.dart';

import 'package:flutter_ahlul_quran_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address.';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Invalid email format.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password.';
    }
    if (value.length < 5) {
      return 'Password should be at least 5 characters.';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final enteredEmail = _emailController.text;
      final enteredPassword = _passwordController.text;

      // Check if the entered credentials match any member in dummyMembers
      final authenticatedMember = dummyMembers.firstWhere(
            (member) =>
        member.email == enteredEmail && member.password == enteredPassword,
      );

      if (authenticatedMember != null) {
        // Authentication successful, navigate to the home screen
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      } else {
        // Authentication failed, show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email or password. Please try again.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'السلام عليكم، مرحبا بكم',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset('assets/ngajii.png', height: 276,),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(25)),
                          contentPadding: EdgeInsets.all(15),
                          labelText: 'Email',
                        ),
                        validator: _validateEmail,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            labelText: 'Password',
                            contentPadding: EdgeInsets.all(15)),
                        validator: _validatePassword,
                      ),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
                SizedBox(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}