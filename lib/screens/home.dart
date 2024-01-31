import 'package:flutter/material.dart';
import 'package:main_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //AppBar******************************************************************
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: const Text('Welcome to List-View',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          
        ),
        ),
        actions: [
          IconButton(onPressed: (){
            //Signout Alert*****************************
             showDialog(
              context: context,
               builder: (context){
                   return AlertDialog(
                     title: const Text('Are you sure'),
                     //yes or no buttons***
                     actions: [
                       //Yes Button
                         TextButton(
                           onPressed: (){
                              signout(context);
                           }, 
                         child: const Text('Yes')
                         ),
                        //No Button
                         TextButton(
                           onPressed: (){
                             Navigator.of(context).pop(context);
                           }, 
                           child: const Text('No'))
                   
                     ],
                   );
             }
             );
          }, icon: const Icon(Icons.logout)
          )
        ],
      ),

      //Body***************************************************************************

      body: SafeArea(
        child: ListView.separated(
        
          itemBuilder: (context,index)
          {
            return ListTile(
              
              title: Text("Person $index"),
              subtitle: Text("Message $index"),

              leading: index % 2 == 0 ? const CircleAvatar(
                backgroundImage: AssetImage('assets/images/cute_cat.jpg'),
                radius: 30,):
                AspectRatio(aspectRatio: 1/1,
                child: Image.asset('assets/images/cute_cat2.jpg'),)
               
            );
          },
           separatorBuilder: (context,index)
           {
            return const Divider();
           },
            itemCount: (30)
            ),
        ),
    );
  }


  //function for signing out and go-to login
  signout(BuildContext context) async {

    //Resetting sharedfpreference to false while logging out
    final _sharedPrefs = await SharedPreferences.getInstance();
    _sharedPrefs.clear();

    //Removing all the screens and going to login screen
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) => ScreenLogin()), (route) => false);
  }

}