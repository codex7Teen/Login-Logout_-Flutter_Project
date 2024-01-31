import 'package:flutter/material.dart';
import 'package:main_project/main.dart';
import 'package:main_project/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar**********************************
      appBar: AppBar(
        title: const Center(
          child: Text(
            'User Login',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),

      //Body*************************************
      body: SafeArea(
          child: Padding(
                  padding: const EdgeInsets.all(45),
                  child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                //textformfield validation start
                validator: (username) =>
                    username!.isEmpty ? "Username can't be empty" : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //textformfield validation end
          
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                //textformfield validation start
                validator: (password) =>
                    password!.isEmpty ? "Password can't be empty" : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                //textformfield validation end
          
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    //Checking whether textfield is null or not
                    if (_formKey.currentState!.validate()) {
                      checkLogin(context);
                    }
                  },
                  icon: const Icon(Icons.login_rounded),
                  label: const Text('Click to Login'))
            ],
          ),
                  ),
                )),
    );
  }

  void checkLogin(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;
    if (username == password) {

      //Shared preference setting to true
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      //Go to Home
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          // ignore: prefer_const_constructors
          MaterialPageRoute(builder: (context) => ScreenHome()));
    } else {
      final _errormessage = 'Username & Password Mismatch';

      //Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(40),
          backgroundColor: Colors.red,
          content: Text(_errormessage)));
    }
  }
}
