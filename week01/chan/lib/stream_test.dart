void main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    print('countStream : $i');
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = await stream.last;
  return sum;
}