import 'package:flutter/material.dart';


class RecipeView extends StatefulWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70
      ),
      body: Container(

      ),
    );
  }
}
