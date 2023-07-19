void main() {
  example1();
  example2();
  // covariant, deffered, mixin, rethrow, typedef, yield, with, show, on, library, sync, external, export

}

example1(){
  var isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);
  String playerName(String? name) {
    return name ?? 'Guest';
  }
  print(playerName(''));
  print(playerName(null));
}

example2(){
  var number = 42;
  printInteger(number);
}

printInteger(int aNumber){
  print('The number is $aNumber.');
}