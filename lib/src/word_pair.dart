import 'dart:math';

/// Representation of a combination of 2 words, [first] and [second].

final _random = Random();

enum TypeOfPair {
  adjective_adjective,
  noun_noun,
  verb_verb,
  adjective_noun,
  verb_adjective,
  verb_noun,
  random_pair
}

Iterable<WordPair> generateWordPairs(
    {TypeOfPair typeOfPair = TypeOfPair.random_pair, Random random}) sync* {
  random ??= _random;

  String pickRandom(List<String> list) => list[random.nextInt(list.length)];

  // We're in a sync* function, so `while (true)` is okay.
  // ignore: literal_only_boolean_expressions
  while (true) {
    String firstWord;
    String secondWord;

    ///todo creating pairs depending on TypeOfPair

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
}
