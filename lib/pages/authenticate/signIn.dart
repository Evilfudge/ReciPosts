import 'package:flutter/material.dart';
import 'package:recies/colors/colorPallete.dart';
import 'package:recies/widgets/BText.dart';
import 'package:recies/dimensions.dart';
import 'package:recies/widgets/SText.dart';
import 'package:recies/controller/authenticate.dart';

class SignInPage extends StatefulWidget {
  final toggle;

  const SignInPage({required this.toggle});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  final _accountKey = GlobalKey<FormState>();
  bool loadingState = false;

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
              // ===========================GREETING SECTION===========================
              Column(
                children: [
                  BText(text: "Welcome!", color: Colors.black,size: 40, fontWeigt: FontWeight.bold,)
                ],
              ),
              //===========================INPUT SECTION===========================
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                      prefixIcon: Icon(Icons.person, color: ColorPallete.secondary,)
                    ),
                  ),
                  //===========================PASSWORD FIELD===========================
                  SizedBox(height: Dimensions.height10,),
                  TextFormField(
                    validator: (value) => (value!.isEmpty) ? 'Password required' : null,
                    onChanged: (value) => setState(() => password = value),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide: BorderSide.none),
                        filled: true,
                        prefixIcon: Icon(Icons.lock_person, color: ColorPallete.secondary,)
                    ),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  //===========================SIGN IN BUTTON===========================
                  ElevatedButton(
                    onPressed: () async {
                      if (_accountKey.currentState!.validate()) {
                        setState(() {
                          loadingState = true;
                        });
                        dynamic result = await _auth.login(email, password);
                        if(result == null) {
                          setState(() => error = 'please enter a valid email');
                          loadingState = false;
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.secondary,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: Dimensions.iconSize16)
                  ),
                    child: SText(text: "Sign In",color: Colors.white, size: Dimensions.font20,),
                  ),
                  Text(error)
                ],
              ),
              //===========================SIGN UP SECTION===========================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SText(text: "Don't have account? ", color: Colors.black54, size: Dimensions.font16,),
                  //===========================SIGN UP BUTTON===========================
                  TextButton(
                      onPressed: () async => widget.toggle(),
                      child: SText(
                        text: "Sign Up",
                        color: ColorPallete.secondary,
                        size: Dimensions.font16,))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
