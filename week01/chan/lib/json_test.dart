import 'dart:convert';

void main() {
  var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
  ''';

  var scores = jsonDecode(jsonString);
  assert(scores is List);
  var firstScore = scores[0];
  print(scores is List);
  var firstScoreMap = firstScore as Map;
  print(firstScoreMap is Map);
  print(firstScoreMap['score'] == 40);
}