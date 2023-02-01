import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recies/colors/colorPallete.dart';
import 'package:recies/widgets/BText.dart';

import 'package:recies/diminsions.dart';

import '../../widgets/SText.dart';



class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(Diminsions.width20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //hello!
            Column(
              children: [
                BText(text: "Welcome!", color: Colors.black,size: 40, fontWeigt: FontWeight.bold,)
              ],
            ),
            //input field
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //email
                SizedBox(height: Diminsions.height10,),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(Diminsions.radius20),
                    borderSide: BorderSide.none),
                    filled: true,
                    prefixIcon: Icon(Icons.person, color: ColorPallete.secondary,)
                  ),
                ),
                //password
                SizedBox(height: Diminsions.height10,),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(Diminsions.radius20),
                          borderSide: BorderSide.none),
                      filled: true,
                      prefixIcon: Icon(Icons.lock_person, color: ColorPallete.secondary,)
                  ),
                  obscureText: true,
                ),
                SizedBox(height: Diminsions.height10,),
                ElevatedButton(
                    onPressed: (){},
                    child: SText(text: "Sign In",color: Colors.white, size: Diminsions.font20,),
                  style: ElevatedButton.styleFrom(
                    primary: ColorPallete.secondary,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: Diminsions.iconSize16)
                  ),
                )
              ],
            ),
            //sign up button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SText(text: "Don't have account? ", color: Colors.black54, size: Diminsions.font16,),
                TextButton(onPressed: (){}, child: SText(text: "Sign Up", color: ColorPallete.secondary, size: Diminsions.font16,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
