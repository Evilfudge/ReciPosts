import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recies/colors/colorPallete.dart';
import 'package:recies/dimensions.dart';
import 'package:recies/pages/Categories/categoriesPage.dart';
import 'package:recies/pages/recipy_page/foodRecipy.dart';
import 'package:recies/widgets/BText.dart';
import 'package:recies/widgets/recipyTitle.dart';


class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}
//
class _HomeBodyState extends State<HomeBody> {
  PageController pageController = PageController(viewportFraction: 0.85 );
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
     setState(() {
       _currentPageValue = pageController.page!;
     });
    });
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //===========================SLIDER===========================
        Container(

          height: Dimensions.pageView,
          //===========================ROUTES GO TO CATEGORY PAGE===========================
          child: GestureDetector(
            onTap: (){
              Get.to(() => CategoriesPage());
            },
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position){
                  return _buildPageItem(position);
                }),
          ),
        ),
        //===========================DOTS SLIDER INDICATOR===========================
            new DotsIndicator(
            dotsCount: 5,
            position: _currentPageValue,
            decorator: DotsDecorator(
            activeColor: ColorPallete.prime,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
    ),
        //===========================RECENT SECTION TITLE===========================
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BText(text: "Recent")
            ],
          ),
        ),
        //===========================RECENT SECTION LIST===========================
          ListView.builder(
           physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
             //===========================ROUTES GO TO RECIPY PAGE===========================
            return GestureDetector(
              onTap: (){
                Get.to(() => FoodRecipy());
              },
              child: Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                child: Row(
                  children: [
                    //recipy image
                    Container(
                      width: Dimensions.imgSize,
                      height: Dimensions.imgSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), bottomLeft: Radius.circular(Dimensions.radius20)),
                        color: Colors.white30,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/food1.jpeg")
                        )
                      ),
                    ),
                    //recipy text
                    Expanded(
                      child: Container(
                              height: Dimensions.textContainerSize,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20), bottomRight: Radius.circular(Dimensions.radius20)),
                              color: Colors.white
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RecipyTitle(text: "burger")
                          ],
                        ),
                        ),

                    ))
                  ],
                ),
              ),
            );
        }),
        
   
      ],
      
    );
  }
  Widget _buildPageItem(int index){
    //===========================MAKING SLIDING EFFECT FOR STACK WIDGET===========================
    Matrix4 matrix = Matrix4.identity();

    if (index == _currentPageValue.floor()){
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currenTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currenTransform, 0);

    }

    else if (index == _currentPageValue.floor() + 1){
      var currentScale = _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currenTransform = _height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currenTransform, 0);
    }

    else if (index == _currentPageValue.floor() - 1){
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currenTransform = _height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currenTransform, 0);
    }
    else{
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //===========================SLIDER IMAGE===========================
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Color(0xFF69c5df),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/image/food1.jpeg"
                    )
                )
            ),
          ),
          //===========================CARD ABOVE THE IMAGE PROPERTIES===========================
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer80,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height45),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0)
                    ),
                  ]
              ),
              //===========================CATEGORY NAME===========================
              child: Container(
                padding: EdgeInsets.only( left: Dimensions.paddingwidth15, right: Dimensions.paddingwidth15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BText(text: "Food Category ",color: Colors.black87, size: Dimensions.font26,)
                  ],
                )
              ),

            ),
          )
        ],
      ),
    );
  }
}