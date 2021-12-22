import 'package:test/test.dart';

import 'package:russian_words/russian_words.dart';

void main() {
  test('Word pair has sane equality', () {
    final a = WordPair("ключ", "мозг");
    final b = WordPair("ключ", "мозг");
    final c = WordPair("ключ", "Mозг");
    expect(a, b);
    expect(a.hashCode, b.hashCode);
    expect(a, isNot(c));
    expect(a.hashCode, isNot(c.hashCode));
  });

  test('WordPair provides PascalCase', () {
    final a = WordPair("смелый", "руль");
    final b = WordPair("школьный", "актив");
    final c = WordPair("шуточный", "куст");
    final d = WordPair("песчаный", "лопух");
    expect(a.asPascalCase, "СмелыйРуль");
    expect(b.asPascalCase, "ШкольныйАктив");
    expect(c.asPascalCase, "ШуточныйКуст");
    expect(d.asPascalCase, "ПесчаныйЛопух");
  });

  test('WordPair provides camelCase', () {
    final a = WordPair("смелый", "руль");
    final b = WordPair("школьный", "актив");
    final c = WordPair("шуточный", "куст");
    final d = WordPair("песчаный", "лопух");
    expect(a.asCamelCase, "смелыйРуль");
    expect(b.asCamelCase, "школьныйАктив");
    expect(c.asCamelCase, "шуточныйКуст");
    expect(d.asCamelCase, "песчаныйЛопух");
  });

  test('WordPair provides lowercase', () {
    final a = WordPair("смелый", "руль");
    final b = WordPair("школьный", "актив");
    final c = WordPair("шуточный", "куст");
    final d = WordPair("песчаный", "лопух");
    expect(a.asLowerCase, "смелыйруль");
    expect(b.asLowerCase, "школьныйактив");
    expect(c.asLowerCase, "шуточныйкуст");
    expect(d.asLowerCase, "песчаныйлопух");
  });

  test('WordPair provides UPPERCASE', () {
    final a = WordPair("смелый", "руль");
    final b = WordPair("школьный", "актив");
    final c = WordPair("шуточный", "куст");
    final d = WordPair("песчаный", "лопух");
    expect(a.asUpperCase, "СМЕЛЫЙРУЛЬ");
    expect(b.asUpperCase, "ШКОЛЬНЫЙАКТИВ");
    expect(c.asUpperCase, "ШУТОЧНЫЙКУСТ");
    expect(d.asUpperCase, "ПЕСЧАНЫЙЛОПУХ");
  });

  test('WordPair.random returns normally', () {
    expect(() => WordPair.random(), returnsNormally);
  });

  test('WordPair throws on empty members', () {
    expect(() => WordPair("сложный", ""), throwsArgumentError);
    expect(() => WordPair("", "озеро"), throwsArgumentError);
  });
}
