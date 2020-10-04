// Declarando as variáveis
boolean isCollision = false, up = false, down = false, left = false, right = true;
int widthOfSquare = 20;

// Declarando as intâncias
SnakeCharacter snake = new SnakeCharacter();
Fruit fruit = new Fruit();

// Setup inicial
void setup() {
  size(600, 600);
  textAlign(CENTER, CENTER);
  textSize(18);
  frameRate(10);
  snake.setFruit(fruit.fruitPoint);
}

// Roda o jogo
void draw() {
  background(255);
  if (!isGameOver()) { // Roda o jogo, mas só se isGameOver é falso 
    MostraMundo(); // Desenha um grid na tela
    snake.create(); // Desenha a cobra na tela
    isCollision = snake.move(); // Boolean checks if snake will continue moving
    snake.score(); // Displays number of fruit collected
    fruit.display(); // Displays fruit on screen
  } else {
    gameOver(); // Runs gameOver() if snake touches border or itself
  }
  if (isCollision) { // Creates new coordinates for fruit when snake touches it 
    fruit = new Fruit(); // Creates new fruit coordinates
    snake.setFruit(fruit.fruitPoint); // Sets fruit coordinates to the new one made above
  }
}

//Grid
void MostraMundo() {
  stroke(224, 224, 224);
  for (int i = 0; i < 30; i++) {
    line(i*widthOfSquare, 0, i*widthOfSquare, 600);
    line(0, i*widthOfSquare, 600, i*widthOfSquare);
  }
}

// Boolean que checa se a cobra tocou as bordas ou ela mesma
boolean isGameOver() {
  return snake.isSnakeTouched() || snake.isBorderTouched();
}

// Mostra tela de Game Over
void gameOver() {
  fill (0);
  text("GAME OVER", 300, 285);
  text("Aperte enter para reniciar", 305, 315);
  if (keyCode == ENTER || keyCode == RETURN) { // Restarts game when Enter is pressed
    snake.reset();
    keyCode = ALT; // Resets keyCode to prevent game from resetting automatically upon next Game Over
  }
}

// Allows snake movement, but inhibits opposite movement
void keyPressed() {
  if (keyCode == UP) {
    if (!down) {
      snake.direction(0, -1);
      up = true;
      down = false;
      right = false;
      left = false;
    }
  } else if (keyCode == DOWN) {
    if (!up) {
      snake.direction(0, 1);
      down = true;
      up = false;
      right = false;
      left = false;
    }
  } else if (keyCode == LEFT) {
    if (!right) {
      snake.direction(-1, 0);
      down = false;
      up = false;
      left = true;
      right = false;
    }
  } else if (keyCode == RIGHT) {
    if (!left) {
      snake.direction(1, 0);  
      down = false;
      up = false;
      right = true;
      left = false;
    }
  }
}
