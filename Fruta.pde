class Fruit {
  // Declarando as intâncias
  Point fruitPoint = new Point();

  // Construtor que desenha a fruta em posições diferentes na tela
  Fruit() {
    fruitPoint.x = (int(random(1, 30)));
    fruitPoint.y = (int(random(1, 30)));
  }

  // Mostra a fruta
  void display() {
    fill(255, 0, 0);
    rect(fruitPoint.x*20, fruitPoint.y*20, 20, 20);
  }
}
