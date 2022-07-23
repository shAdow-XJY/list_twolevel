import 'package:flutter/material.dart';
import 'package:list_twolevel/list_A.dart';
import 'package:list_twolevel/list_B.dart';
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

  bool click = true;

  List<Map<String, String>> listALevelObj = [
    {'title': 'Vue', 'image': 'assets/Vue.png'},
    {'title': 'Web', 'image': 'assets/Web.png'},
    {'title': 'Flutter', 'image': 'assets/Flutter.png'},
    {'title': 'UnrealEngine', 'image': 'assets/UnrealEngine.png'}
  ];
  listA (){
    return AListBuilder(
      levelObj: listALevelObj,
      backgroundColor: const Color(0xFF2E2E48),
      onPressed: (selectedCategory) {
        debugPrint('click $selectedCategory ');
        setState(() {
          click = !click;
        });
      },
    );
  }

  List<Map<String, String>> listBLevelObj = [
    {'title':'title1'},
    {'title':'title2'},
    {'title':'title3'},
    {'title':'title4'},
    {'title':'title5'},
    {'title':'title6'},
    {'title':'title7'},
    {'title':'title8'},
    {'title':'title9'},
    {'title':'title10'},
    {'title':'title11'},
    {'title':'title12'},
    {'title':'title13'},
    {'title':'title14'},
    {'title':'title15'},
  ];
  listB (){
    return BListBuilder(
      levelObj: listBLevelObj,
      itemHeight: 50,
      backgroundColor: const Color(0xFF2E2E48),
      onPressed: (selectedTitle) {
        debugPrint('click $selectedTitle ');
        setState(() {
          click = !click;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464667),
        body: click
            ? listA()
            : listB()
    );
  }
}
