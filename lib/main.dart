import 'package:flutter/material.dart';

void main() {
  runApp(const ReciPosts());
}

class ReciPosts extends StatelessWidget {
  const ReciPosts({super.key});

  static const String _title = 'ReciPosts';
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
          title: const Text(_title),
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
  String test ='';
  callback(varTest){
    setState(() {
      test=varTest;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        children: <Widget>[
          Text(test),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardRecipeConfig(),
                CardRecipeConfig(),
                CardRecipeConfig(),
              ],
            ),
          ),
          TitleSetting(test: "Test2", callbackFunction:callback),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CardRecipeConfig(),
              CardRecipeConfig(),
              CardRecipeConfig(),
            ],
          ),
          TitleSetting(test: "Test", callbackFunction:callback),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CardRecipeConfig(),
              CardRecipeConfig(),
              CardRecipeConfig(),
              CardRecipeConfig(),
              CardRecipeConfig(),

            ],
          ),
        ],
      ),
    );
  }
}

class TitleSetting extends StatelessWidget {
  final String test;

  final Function callbackFunction;
  const TitleSetting({
    Key? key,
    required this.test, required this.callbackFunction
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
              callbackFunction(test);
            },
          )
        ],
      ),
    );
  }
}

class CardRecipeConfig extends StatelessWidget {
  const CardRecipeConfig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(20),
          child: const Text('Portion')),
    );
  }
}
