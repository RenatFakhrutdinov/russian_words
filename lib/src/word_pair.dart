import 'dart:math';

import 'words/adjectives.dart';
import 'words/all_words.dart';
import 'words/nouns.dart';
import 'words/verbs.dart';

/// Representation of a combination of 2 words, [first] and [second].

final _random = Random();

enum TypeOfPair {
  adjectiveAdjective,
  nounNoun,
  verbVerb,
  adjectiveNoun,
  verbAdjective,
  verbNoun,
  randomPair
}

Iterable<WordPair> generateWordPairs(
    {TypeOfPair typeOfPair = TypeOfPair.randomPair, Random random}) sync* {
  random ??= _random;

  String pickRandom(List<String> list) => list[random.nextInt(list.length)];

  // We're in a sync* function, so `while (true)` is okay.
  // ignore: literal_only_boolean_expressions
  while (true) {
    String firstWord;
    String secondWord;

    switch (typeOfPair) {
      case TypeOfPair.adjectiveAdjective:
        firstWord = pickRandom(adjectives);
        secondWord = pickRandom(adjectives);
        break;
      case TypeOfPair.nounNoun:
        firstWord = pickRandom(nouns);
        secondWord = pickRandom(nouns);
        break;
      case TypeOfPair.verbVerb:
        firstWord = pickRandom(verbs);
        secondWord = pickRandom(verbs);
        break;
      case TypeOfPair.adjectiveNoun:
        firstWord = pickRandom(adjectives);
        secondWord = pickRandom(nouns);
        break;
      case TypeOfPair.verbAdjective:
        firstWord = pickRandom(verbs);
        secondWord = pickRandom(adjectives);
        break;
      case TypeOfPair.verbNoun:
        firstWord = pickRandom(verbs);
        secondWord = pickRandom(nouns);
        break;
      case TypeOfPair.randomPair:
        firstWord = pickRandom(allWords);
        secondWord = pickRandom(allWords);
        break;
    }

    final WordPair wordPair = WordPair(firstWord, secondWord);

    yield wordPair;
  }
}

class WordPair {
  /// The first part of the pair.
  final String first;

  /// The second part of the pair.
  final String second;

  WordPair(this.first, this.second) {
    if (first == null || second == null) {
      throw ArgumentError("Words of WordPair cannot be null. "
          "Received: '$first', '$second'");
    }
    if (first.isEmpty || second.isEmpty) {
      throw ArgumentError("Words of WordPair cannot be empty. "
          "Received: '$first', '$second'");
    }
  }

  factory WordPair.random(
      {TypeOfPair typeOfPair = TypeOfPair.randomPair, Random random}) {
    random ??= _random;
    final pairsIterable =
        generateWordPairs(typeOfPair: typeOfPair, random: random);
    return pairsIterable.first;
  }
  //test
}
