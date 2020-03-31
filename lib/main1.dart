import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Suggestions(),
    );
  }
}

final Style = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class Suggestions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SuggestionsState();
  }
}

class SuggestionsState extends State<Suggestions> {
  final _arr = <WordPair>[];
  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'hello world',
        ),
        actions: <Widget>[IconButton(icon: Icon(Icons.list), onPressed: _push,)],
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();
            var index = i ~/ 2;
            if (index >= _arr.length) {
              _arr.addAll(generateWordPairs().take(10));
            }
            return renderRow(_arr[index]);
          }),
    );
  }

  void _push(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final tiles = _saved.map((item){
           return  ListTile(title:Text(
              item.asPascalCase,
              style: Style,
          ));
          });
          final divided = ListTile.divideTiles(tiles: tiles,context:context).toList();
          return Scaffold(
            appBar: AppBar(title:Text('save suggestions')),
            body:ListView(children: divided),
          );
      }
      )
    );
  }

  Widget renderRow(WordPair wd) {
    final isSaved = _saved.contains(wd);
    return ListTile(
      title: Text(wd.asPascalCase, style: Style),
      trailing: Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
        size: isSaved ? 22 : 16,
      ),
      onTap: () {
        setState(() {
          isSaved ? _saved.remove(wd) : _saved.add(wd);
        });
      },
    );
  }
}
