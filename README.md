# russian_words

[![Pub](https://img.shields.io/pub/v/russian_words)](https://pub.dev/packages/russian_words)

A package containing ~33000 the most common Russian words and some utility functions.

## Usage
Printing the top 50 most used nouns, adjectives, verbs in the Russian language:

```

import 'package:russian_words/russian_words.dart';

void main() {
  nouns.take(50).forEach(print);
  adjectives.take(50).forEach(print);
  verbs.take(50).forEach(print);
  
  ///all words
  allWords.take(50).forEach(print);
}

```

Generating 5 interesting word combinations:

```

generateWordPairs().take(5).forEach(print);

///create 5 verb + noun combination
generateWordPairs(typeOfPair: TypeOfPair.verbNoun).take(5).forEach(print);

```


## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/RenatFakhrutdinov/russian_words/issues/).

## Inspired project

https://github.com/filiph/english_words
