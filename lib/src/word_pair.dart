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
    {TypeOfPair typeOfPair = TypeOfPair.randomPair, Random? random}) sync* {
  final rand = random ?? _random;

  String pickRandom(List<String> list) => list[rand.nextInt(list.length)];

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

  // String _asPascalCase;
  //
  // String _asSnakeCase;
  //
  // String _asCamelCase;
  //
  // String _asLowerCase;
  //
  // String _asUpperCase;
  //
  // String _asString;

  WordPair(this.first, this.second) {
    if (first.isEmpty || second.isEmpty) {
      throw ArgumentError("Words of WordPair cannot be empty. "
          "Received: '$first', '$second'");
    }
  }

  factory WordPair.random(
      {TypeOfPair typeOfPair = TypeOfPair.randomPair, Random? random}) {
    random ??= _random;
    final pairsIterable =
        generateWordPairs(typeOfPair: typeOfPair, random: random);
    return pairsIterable.first;
  }

  /// Returns the word pair as a simple string, with second word capitalized.
  late final String asCamelCase = _createCamelCase();

  /// Returns the word pair as a simple string, in lower case.
  late final String asLowerCase = asString.toLowerCase();

  /// Returns the word pair as a simple string, with each word capitalized.
  late final String asPascalCase = _createPascalCase();

  /// Returns the word pair as a simple string, separated by an underscore.
  late final String asSnakeCase = _createSnakeCase();

  /// Returns the word pair as a simple string.
  late final String asString = '$first$second';

  /// Returns the word pair as a simple string, in upper case.
  late final String asUpperCase = asString.toUpperCase();

  @override
  int get hashCode =>
      (first.hashCode.toString() + second.hashCode.toString()).hashCode;

  @override
  bool operator ==(Object other) {
    if (other is WordPair) {
      return first == other.first && second == other.second;
    } else {
      return false;
    }
  }

  /// Returns a string representation of the [WordPair] where the two parts
  /// are joined by [separator].
  String join([String separator = '']) => '$first$separator$second';

  /// Creates a new [WordPair] with both parts in lower case.
  WordPair toLowerCase() => WordPair(first.toLowerCase(), second.toLowerCase());

  @override
  String toString() => asString;

  String _capitalize(String word) {
    return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
  }

  String _createCamelCase() => "${first.toLowerCase()}${_capitalize(second)}";

  String _createPascalCase() => "${_capitalize(first)}${_capitalize(second)}";

  String _createSnakeCase() => "${first}_$second";
}
