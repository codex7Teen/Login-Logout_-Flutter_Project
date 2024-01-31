import 'package:flutter/material.dart';
import 'package:main_project/main.dart';
import 'package:main_project/screens/home.dart';
import 'package:main_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
        child: Image.asset('assets/images/imagex.png',height: 125,),
      )
      ),
    );
  }

 
 Future<void> gotologin() async {
  await Future.delayed(Duration(seconds: 3));
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()
  )
  );
 }


//Shared preference getting
 Future<void> checkUserLoggedIn() async {
  final _sharedPrefs = await SharedPreferences.getInstance();
  final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
  if (_userLoggedIn == null || _userLoggedIn == false)
  {
    gotologin();
  }else {
     await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => ScreenHome()
    )
    );
  }
 } 

}