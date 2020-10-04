class SnakeCharacter {
  // Declarando as variáveis
  int xSpeed = 1, ySpeed = 0;

  // Declarando as intâncias e listas
  Point fruit;
  ArrayList<Point> pointList = new ArrayList<Point>();

  // Constructor that adds to snake length
  SnakeCharacter() {
    pointList.add(new Point(15, 15));
  }

  // Displays score (length of snake)
  void score() {
    fill(0);
    text(pointList.size()-1, 10, 10);
  }

  // Criando a cobra
  void create() {
    fill(199, 234, 70);
    for (Point point : pointList) { // Draws as many squares as fruit collected
      rect(point.x*20, point.y*20, 20, 20); // Draws snake square on a grid space
    }
  }

  // Movimenta a direção da cobra pelo key pressed
  void direction(int x, int y) {
    xSpeed = x;
    ySpeed = y;
  }

  // Boolean que checa se a cobra se moveu e desenha a cabeça dela na direção correta
  boolean move() {
    // Gets snake head from list
    Point head = pointList.get(0);

    // Gets coordinates from snake head
    int xHead = head.x;
    int yHead = head.y;

    // Calculates the position of the new snake head
    int newHeadx = xHead + xSpeed;
    int newHeady = yHead + ySpeed;

    // Creates the new snake head and adds it to the beginning of the list
    Point newHead = new Point(newHeadx, newHeady);
    pointList.add(0, newHead);

    // Removes the snake tail if there is no collision
    boolean isCollision = isFruitTouched(newHead);
    if (!isCollision) {
      pointList.remove(pointList.size() - 1);
    }
    return isCollision;
  }

  // Sets temporary fruit coordinates 
  void setFruit(Point tempFruit) {
    fruit = tempFruit;
  }

  // Boolean checks if a fruit was touched
  boolean isFruitTouched(Point snakeHead) {
    if (snakeHead.x == fruit.x && snakeHead.y == fruit.y) {
      return true;
    } else {
      return false;
    }
  }

  // Boolean checks if the border was touched
  boolean isBorderTouched() {
    if (pointList.get(0).x < 0 || pointList.get(0).y < 0 || pointList.get(0).x >= 30 || pointList.get(0).y >= 30) {
      return true;
    } 
    return false;
  }

  // Boolean checks if snake touched it self
  boolean isSnakeTouched() {
    Point snakeHead = pointList.get(0);
    for (int i = 1; i < pointList.size(); i++) {
      if (snakeHead.x == pointList.get(i).x && snakeHead.y == pointList.get(i).y) {
        return true;
      }
    }
    return false;
  }

  // Resets variables and snake length
  void reset() {
    xSpeed = 1;
    ySpeed = 0;
    pointList = new ArrayList<Point>();
    pointList.add(new Point(15, 15));
  }
}
