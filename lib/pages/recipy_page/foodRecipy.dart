

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../diminsions.dart';
import '../../widgets/BText.dart';
import '../../widgets/SText.dart';

import '../../widgets/listViewRecipe.dart';
import '../../widgets/recipyTitle.dart';

class FoodRecipy extends StatefulWidget {
  const FoodRecipy({Key? key}) : super(key: key);

  @override
  State<FoodRecipy> createState() => _FoodRecipyState();
}

class _FoodRecipyState extends State<FoodRecipy> {
  static List ingredients = ["hello world1","hello world2","hello world3","hello world4","hello world5","hello world1","hello world2","hello world3","hello world4","hello world5"];
  final List<ListViewRecipe> data = List.generate(
      ingredients.length,
          (index) => ListViewRecipe("${ingredients[index]}"));




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 50,
            title: Row(
                children: [
                  //AppIcons(icon: Icons.arrow_back),
                ],
            ),
            pinned: true,
            expandedHeight:300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food1.jpeg",
                 width: double.maxFinite,
                fit: BoxFit.cover
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: Diminsions.width20, right: Diminsions.width20, top: Diminsions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(Diminsions.radius20), topLeft: Radius.circular(Diminsions.radius20)),
                  color: Colors.white,
                ),
                child: RecipyTitle(text: "Burger"),
                width: double.maxFinite,
              )
          ),
          //ingredients section
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: Diminsions.width20, right: Diminsions.width20, top: Diminsions.height20),
              color: Colors.white,
              child: BText(text: "Ingredients", color: Colors.black,),
            )
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
              (context, index){
                return Container(
                  padding: EdgeInsets.only(left: Diminsions.width20, right: Diminsions.width20, top: Diminsions.height20),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SText(text: data[index].datas, height: 1.8,),
                      SText(text: data[index].datas, height: 1.8,)
                    ],
                  ),
                  );
              },
            childCount: ingredients.length,
          )),
          //steps section
          SliverToBoxAdapter(

              child: Container(
                padding: EdgeInsets.only(left: Diminsions.width20, right: Diminsions.width20, top: Diminsions.height20),
                color: Colors.white,
                child: BText(text: "Steps", color: Colors.black,),
              )
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
                (context, index){
              return Container(
                padding: EdgeInsets.only(left: Diminsions.width20, right: Diminsions.width20, top: Diminsions.height20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SText(text: data[index].datas, height: 1.8,),
                  ],
                ),
              );
            },
            childCount: ingredients.length,
          )),

        ],
      )

    );
  }
}
