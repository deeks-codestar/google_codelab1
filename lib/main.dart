import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:developer';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to flutter',
        home: RandomWords(),
    );
  }
}


class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _wordPairs = <WordPair> [];
  final TextStyle _textStyle = const TextStyle(fontSize: 18);
  final List<bool> _isSet = <bool>[];


  Widget _buildRow(WordPair wordPair, int i) {
    return ListTile(
      trailing: Icon(
          Icons.favorite_border
      ),
      title: Text(
        wordPair.asPascalCase,
        style: _textStyle,

      ),
      onTap: () {
        _isSet[i] = !_isSet[i];
        
      }
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(5),
        itemBuilder: (BuildContext context, int i) {
          if (i % 2 != 0)
            return Divider();
          final int _index = i ~/ 2;
          if (_index >= _wordPairs.length) {
            _wordPairs.addAll(generateWordPairs().take(10));
          }
          _isSet.add(false);
          return _buildRow(_wordPairs[_index], i);
        }

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Flutter app"),
      ),
      body: Center(
        child: _buildSuggestions(),
      ),
    );

  }
}

/*
class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _wordPairs = <WordPair> [];
  final TextStyle _textStyle = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    _wordPairs.add(wordPair);
    log('WordPairs: $_wordPairs');

    return Text(wordPair.asPascalCase);
  }
}
WordPairs: [stemlap, drunkbean, breadoil, portdock]
*/