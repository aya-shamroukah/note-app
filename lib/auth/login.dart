// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  DateTime d1 = DateTime.now();
  DateTime d2 = DateTime.now();
  savep()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString(' user name', 'aya');
    prefs.setString('password', 'aya123');
    print('sucess');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(top: 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/aa.png',
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.grey[800],
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 245, 190, 51)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: 'user name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    cursorColor: Colors.grey[800],
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 245, 190, 51)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: 'password',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('if you dont have account'),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('singup');
                          },
                          child: Text(
                            '  click her',
                            style: TextStyle(
                                color: Colors.orange[600], fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    //height: 20,
                    child: MaterialButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: ()async {
                          await savep();
                        Navigator.of(context).pushNamed('homepage');
                         
                        //print(DateTime.now().add(Duration(days: 1)));
                       // print(d1.isBefore(d2));
                      },
                      child: Text(
                        'Login',
                      ),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
