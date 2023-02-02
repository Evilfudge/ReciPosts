import 'package:flutter/material.dart';
import 'package:recies/colors/colorPallete.dart';
import 'package:recies/widgets/BText.dart';
import 'package:recies/dimensions.dart';
import 'package:recies/widgets/SText.dart';
import 'package:recies/controller/authenticate.dart';

class SignUpPage extends StatefulWidget {
  final toggle;

  const SignUpPage({required this.toggle});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  final _accountKey = GlobalKey<FormState>();
  bool loadingState = false;

  String username = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(Dimensions.width20),
        child: Form(
          key: _accountKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ===========================GREETING===========================
              Column(
                children: [
                  BText(text: "Welcome!", color: Colors.black,size: 40, fontWeigt: FontWeight.bold,)
                ],
              ),
              //===========================INPUT FIELD SECTION===========================
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //===========================USERNAME FIELD===========================
                  SizedBox(height: Dimensions.height10),
                  TextFormField(
                    validator: (value) => (value!.isEmpty) ? 'Username required' : null,
                    onChanged: (value) => setState(() => username = value),
                    decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide: BorderSide.none),
                        filled: true,
                        prefixIcon: Icon(Icons.person, color: ColorPallete.secondary,)
                    ),
                  ),
                  //===========================EMAIL FIELD===========================
                  SizedBox(height: Dimensions.height10,),
                  TextFormField(
                    validator: (value) => (value!.isEmpty) ? 'Email required' : null,
                    onChanged: (value) => setState(() => email = value),
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide: BorderSide.none),
                        filled: true,
                        prefixIcon: Icon(Icons.email, color: ColorPallete.secondary,)
                    ),
                  ),
                  //===========================PASSWORD FIELD===========================
                  SizedBox(height: Dimensions.height10,),
                  TextFormField(
                    validator: (value) => (value!.isEmpty) ? 'Passowrd required' : null,
                    onChanged: (value) => setState(() => password = value),
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide: BorderSide.none),
                        filled: true,
                        prefixIcon: Icon(Icons.lock_person, color: ColorPallete.secondary,)
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: Dimensions.height10,),
                  //===========================SIGN UP BUTTON===========================
                  ElevatedButton(
                    onPressed: () async {
                      if (_accountKey.currentState!.validate()) {
                        setState(() {
                          loadingState = true;
                        });
                        dynamic result = await _auth.register(email, password, username);
                        if(result == null) {
                          setState(() => error = 'please enter a valid email');
                          loadingState = false;
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.secondary,
                        shape: const StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: Dimensions.iconSize16)
                    ),
                    child: SText(text: "Sign Up",color: Colors.white, size: Dimensions.font20,),
                  )
                ],
              ),
              //===========================SIGN IN SECTION===========================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SText(text: "Already have an account? ", color: Colors.black54, size: Dimensions.font16,),
                  TextButton(onPressed: () async => widget.toggle(), child: SText(text: "Sign In", color: ColorPallete.secondary, size: Dimensions.font16,))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
