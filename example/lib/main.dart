import 'dart:math';

import 'package:flutter/material.dart';
import 'package:russian_words/russian_words.dart';

enum Category { any, adjective, noun, verb }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'russian_words demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Russian Words'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    SingleWord(),
    RandomPair(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_one), title: Text('Single word')),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_two), title: Text("Random pair"))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}

class SingleWord extends StatefulWidget {
  @override
  _SingleWordState createState() => _SingleWordState();
}

class _SingleWordState extends State<SingleWord> {
  Category _category = Category.any;
  String _word;

  @override
  void initState() {
    super.initState();
    _word ??= _randomWord();
  }

  String _randomWord() {
    switch (_category) {
      case Category.any:
        return allWords[Random().nextInt(allWords.length)];
        break;
      case Category.adjective:
        return adjectives[Random().nextInt(adjectives.length)];
        break;
      case Category.noun:
        return nouns[Random().nextInt(nouns.length)];
        break;
      case Category.verb:
        return verbs[Random().nextInt(verbs.length)];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "Random single word is",
          textAlign: TextAlign.center,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration:
              BoxDecoration(border: Border.all(), color: Colors.blue.shade50),
          width: MediaQuery.of(context).size.width,
          child: Text(
            _word,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Column(
          children: <Widget>[
            Text('Choose category'),
            Row(
              children: <Widget>[
                Radio(
                  value: Category.any,
                  groupValue: _category,
                  onChanged: (category) => setState(() {
                    _category = category;
                    _word = _randomWord();
                  }),
                ),
                Text('any'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: Category.adjective,
                  groupValue: _category,
                  onChanged: (category) => setState(() {
                    _category = category;
                    _word = _randomWord();
                  }),
                ),
                Text('adjective')
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: Category.noun,
                  groupValue: _category,
                  onChanged: (category) => setState(() {
                    _category = category;
                    _word = _randomWord();
                  }),
                ),
                Text('noun')
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: Category.verb,
                  groupValue: _category,
                  onChanged: (category) => setState(() {
                    _category = category;
                    _word = _randomWord();
                  }),
                ),
                Text('verb')
              ],
            ),
          ],
        ),
        RaisedButton(
          child: Text("change word"),
          onPressed: () => setState(() => _word = _randomWord()),
        )
      ],
    );
  }
}

class RandomPair extends StatefulWidget {
  @override
  _RandomPairState createState() => _RandomPairState();
}

class _RandomPairState extends State<RandomPair> {
  String _pair;
  TypeOfPair _typeOfPair = TypeOfPair.randomPair;

  @override
  void initState() {
    super.initState();
    _pair ??= WordPair.random(typeOfPair: _typeOfPair).asPascalCase;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "Random pair is",
          textAlign: TextAlign.center,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration:
              BoxDecoration(border: Border.all(), color: Colors.blue.shade50),
          width: MediaQuery.of(context).size.width,
          child: Text(
            _pair,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Column(
          children: <Widget>[
            Text('Choose type of pair'),
            Row(
              children: <Widget>[
                Radio(
                  value: TypeOfPair.randomPair,
                  groupValue: _typeOfPair,
                  onChanged: (type) => setState(() {
                    _typeOfPair = type;
                    _pair =
                        WordPair.random(typeOfPair: _typeOfPair).asPascalCase;
                  }),
                ),
                Text('RandomPair'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: TypeOfPair.adjectiveAdjective,
                  groupValue: _typeOfPair,
                  onChanged: (type) => setState(() {
                    _typeOfPair = type;
                    _pair =
                        WordPair.random(typeOfPair: _typeOfPair).asPascalCase;
                  }),
                ),
                Text('AdjectiveAdjective')
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: TypeOfPair.nounNoun,
                  groupValue: _typeOfPair,
                  onChanged: (type) => setState(() {
                    _typeOfPair = type;
                    _pair =
                        WordPair.random(typeOfPair: _typeOfPair).asPascalCase;
                  }),
                ),
                Text('NounNoun')
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: TypeOfPair.verbVerb,
                  groupValue: _typeOfPair,
                  onChanged: (type) => setState(() {
                    _typeOfPair = type;
                    _pair =
                        WordPair.random(typeOfPair: _typeOfPair).asPascalCase;
                  }),
                ),
                Text('VerbVerb')
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: TypeOfPair.adjectiveNoun,
                  groupValue: _typeOfPair,
                  onChanged: (type) => setState(() {
                    _typeOfPair = type;
                    _pair =
                        WordPair.random(typeOfPair: _typeOfPair).asPascalCase;
                  }),
                ),
                Text('AdjectiveNoun')
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: TypeOfPair.verbAdjective,
                  groupValue: _typeOfPair,
                  onChanged: (type) => setState(() {
                    _typeOfPair = type;
                    _pair =
                        WordPair.random(typeOfPair: _typeOfPair).asPascalCase;
                  }),
                ),
                Text('VerbAdjective')
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: TypeOfPair.verbNoun,
                  groupValue: _typeOfPair,
                  onChanged: (type) => setState(() {
                    _typeOfPair = type;
                    _pair =
                        WordPair.random(typeOfPair: _typeOfPair).asPascalCase;
                  }),
                ),
                Text('VerbNoun')
              ],
            ),
          ],
        ),
        RaisedButton(
          child: Text("change word"),
          onPressed: () => setState(() =>
              _pair = WordPair.random(typeOfPair: _typeOfPair).asPascalCase),
        )
      ],
    );
  }
}
