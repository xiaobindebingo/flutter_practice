import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String name = 'bingo';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text(name)),
            body: Center(child: RandomWords())));
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {




  final _suggestions = <WordPair>[];
  final _biggerFontStyle = const TextStyle(fontSize: 14);
  final _saved = Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        var length = _suggestions.length;
        print('i is $i, suggestions.length is $length');
        if (i.isOdd) {
          return Divider();
        }
        final _index = i ~/ 2;

        print('index is $_index');
        if (_index >= _suggestions.length) {
          //  _suggestions.addAll(generateWordPairs().take(10));
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[_index]);
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final _alreadySaved = _saved.contains(wordPair);
    return ListTile(
        title: Text(
          wordPair.asPascalCase,
          style: _biggerFontStyle,
        ),
        trailing: Icon(
          _alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: _alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (_alreadySaved) {
              _saved.remove(wordPair);
            } else {
              _saved.add(wordPair);
            }
          });
        });
  }
}
