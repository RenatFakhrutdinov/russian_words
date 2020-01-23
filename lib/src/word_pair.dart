/// Representation of a combination of 2 words, [first] and [second].

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
