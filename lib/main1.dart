//
//
//import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';
//main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final wordPair = WordPair.random(safeOnly: true);
//    return MaterialApp(
//        title: 'i am title',
//        home: Scaffold(
//            appBar: AppBar(title: Text('i am a tt')),
//            body: Center(child: RandomWords(),)));
//  }
//}
//// 创建有状态的State
//class RandomWords extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return RandomWordsState();
//  }
//}
//class RandomWordsState extends State<RandomWords>{
//
//  @override
//  Widget build(BuildContext context) {
//    final p = WordPair.random();
//    return Text(p.asPascalCase);
//  }
//}