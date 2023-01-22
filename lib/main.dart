import 'package:flutter/material.dart';

void main() {
  runApp(const ReciPosts());
}

class ReciPosts extends StatelessWidget {
  const ReciPosts({super.key});

  static const String _title = 'ReciPosts';
  @override
  Widget build(BuildContext context) {
    return ReciPostsTheme(title: _title);
  }
}

class ReciPostsTheme extends StatelessWidget {
  const ReciPostsTheme({
    Key? key,
    required String title,
  }) : _title = title, super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
          colorScheme: const ColorScheme.light(),
          fontFamily: 'Anybody',
          appBarTheme: const AppBarTheme(backgroundColor: Colors.amber)),
      darkTheme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          fontFamily: 'Anybody',
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RecipeButtonText> btnText = [
    RecipeButtonText(text: 'a'),
    RecipeButtonText(text: 'b'),
    RecipeButtonText(text: 'c')
  ];

  List<RecipeIngredients> listIngredient = [
    RecipeIngredients(ingredient: 'Flour'),
    RecipeIngredients(ingredient: 'Water'),
    RecipeIngredients(ingredient: 'Yeast'),
    RecipeIngredients(ingredient: 'Sugar'),
  ];

  List<RecipeVariation> listVariation = [
    RecipeVariation(variation: 'Basic', ingredientOption: [
      'Flour',
      'Water',
      'Yeast'
    ]),
    RecipeVariation(variation: 'Extra Rise', ingredientOption: [
      'Flour',
      'Water',
      'Yeast',
      'Sugar'
    ]),
  ];
  List<RecipeInstructions> listInstruction = [
    RecipeInstructions(variation: 'Basic', instructionOption: [
      'Mix flour and water',
      'Let rise',
      '???',
      'Profit'
    ])
  ];
  @override

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: btnText.map((btnTitle) => cardButton(btnTitle)).toList()
            ),
          ),
          TitleSetting(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                listVariation.map((variant) => cardText(variant)).toList()
            ),
          ),
          TitleSetting(),
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 5),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children:
          //       listInstruction.map((instruction) => cardText(instruction)).toList()
          //   ),
          // )
        ],
      ),
    );
  }

  Widget cardButton(btnTitle){
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            recipeOption(context, btnTitle.text);
          },
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Text(btnTitle.text)
          )
      ),
    );
  }
  Widget cardText(variant) {
    if (variant.variation == 'Basic'){
      variant.ingredientOption.forEach((n) => debugPrint(n));
      return Card(
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: variant.ingredientOption.forEach((n) => Text(n))
          ),
      );
    } else {return const Card();}
  }
  recipeOption(BuildContext context, String text) {

    Widget testOne = SimpleDialogOption(
      child: const Text('date one'),
      onPressed: () {
        //function
        Navigator.of(context).pop();
      },
    );

    Widget testTwo = SimpleDialogOption(
      child: const Text('date two'),
      onPressed: () {
        //function
        Navigator.of(context).pop();
      },
    );

    Widget testThree = SimpleDialogOption(
      child: const Text('date three'),
      onPressed: () {
        //function
        Navigator.of(context).pop();
      },
    );

    SimpleDialog dialog = SimpleDialog(
      title: const Text('Recipe:'),
      children: [
        if(text == 'a') ...[
          testOne,
        ] else if(text == 'b') ...[
          testTwo,
        ] else if(text == 'c') ...[
          testThree,
        ]
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );

  }
}


class TitleSetting extends StatelessWidget {
  const TitleSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Text('Ingredients'),
          SizedBox(width: 20),
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.grey,
            iconSize: 35.0,
            tooltip: 'Settings',
            onPressed: () {
                print('Success');
            },
          )
        ],
      ),
    );
  }
}


class RecipeButtonText {
  String text;
  RecipeButtonText({required this.text});
}

class RecipeIngredients {
  String ingredient;
  RecipeIngredients({required this.ingredient});
}

class RecipeVariation {
  String variation;
  List<String> ingredientOption;
  RecipeVariation({required this.variation, required this.ingredientOption});
}

class RecipeInstructions {
  String variation;
  List<String> instructionOption;
  RecipeInstructions({required this.variation, required this.instructionOption});
}
