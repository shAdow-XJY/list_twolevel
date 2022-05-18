import 'package:flutter/material.dart';
import 'package:list_twolevel/list_twolevel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Two Level List',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> oneLevelObj = [
    {'title': 'Vue', 'image': 'assets/Vue.png'},
    {'title': 'Web', 'image': 'assets/Web.png'},
    {'title': 'Flutter', 'image': 'assets/Flutter.png'},
    {'title': 'UnrealEngine', 'image': 'assets/UnrealEngine.png'}
  ];
  List<Map<String, String>> twoLevelObj = [];

  bool _oneLevel = true;

  void twoLevelInit(String oneLevelTitle) {
    twoLevelObj.clear();
    for(var i = 0; i < 5; i++){
      twoLevelObj.add({
        'title': oneLevelTitle+'$i',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464667),
        body: _oneLevel
            ? ListBuilder(
          oneLevel: _oneLevel,
          levelObj: oneLevelObj,
          backgroundColor: const Color(0xFF2E2E48),
          onPressed: (selectedCategory) {
            if (selectedCategory != 'default') {
              debugPrint('click $selectedCategory ');
              twoLevelInit(selectedCategory);
              setState(() {
                _oneLevel = false;
              });
            }
          },
        )
            :ListBuilder(
          oneLevel: _oneLevel,
          levelObj: twoLevelObj,
          itemHeight: 50,
          backgroundColor: const Color(0xFF2E2E48),
          onPressed: (selectedTitle) {
            if (selectedTitle != 'default') {
              debugPrint('click $selectedTitle ');
              setState(() {
                _oneLevel = true;
              });
            }
          },
        )
    );
  }
}
