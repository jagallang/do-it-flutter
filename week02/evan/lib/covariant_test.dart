void main(){
  var cat = Cat();
  var mouse = Mouse();
  cat.chase(Basketball());
  mouse.chase(SoccerBall());

  // other types
  // cat.chase(Cat());
  // mouse.chase(Mouse());
}

class Ball {}
class SoccerBall extends Ball {}
class Basketball extends Ball {}

class Animal {
  void chase(Ball x) {
    print("Animal chase");
  }
}

class Mouse extends Animal {
  void chase(covariant SoccerBall x) {
    print("Mouse chase");
  }
}

class Cat extends Animal {
  @override
  void chase(covariant Basketball x) {
    super.chase(x);
    print("Cat chase");
  }
}