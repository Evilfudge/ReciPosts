import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:recies/controller/authenticate.dart';
import 'package:recies/models/reciposts_user.dart';
import 'package:recies/pages/wrapper.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<RecipostsUser?>.value(
      catchError: (context, error) => null,
      initialData: null,
      value: AuthService().user,
      child: GetMaterialApp(
        title: 'ReciPosts',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const Wrapper(),
      ),
    );
  }
}