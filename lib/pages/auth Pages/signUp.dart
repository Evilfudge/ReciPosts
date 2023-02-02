import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors/colorPallete.dart';
import '../../diminsions.dart';
import '../../widgets/BText.dart';
import '../../widgets/SText.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(Diminsions.width20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // hello!
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
                      hintText: "Username",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(Diminsions.radius20),
                          borderSide: BorderSide.none),
                      filled: true,
                      prefixIcon: Icon(Icons.person, color: ColorPallete.secondary,)
                  ),
                ),
                //Email
                SizedBox(height: Diminsions.height10,),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(Diminsions.radius20),
                          borderSide: BorderSide.none),
                      filled: true,
                      prefixIcon: Icon(Icons.email, color: ColorPallete.secondary,)
                  ),
                  obscureText: true,
                ),
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
                  child: SText(text: "Sign Up",color: Colors.white, size: Diminsions.font20,),
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
                SText(text: "you have an account? ", color: Colors.black54, size: Diminsions.font16,),
                TextButton(onPressed: (){}, child: SText(text: "Sign In", color: ColorPallete.secondary, size: Diminsions.font16,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
