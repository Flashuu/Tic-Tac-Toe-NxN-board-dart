import 'dart:io';
import 'dart:core';

bool winner = false;
bool moveX = true;
String player = "X";
List<List<String>> gameBoard = [];
void main() {
  print("wybierz rozmiar planszy");
  int n = int.parse(stdin.readLineSync() ?? "3");
  board(n);
  print(gameBoard.join("\n"));
  nastepnyRuch(n);
}

//ruch gracza
void nastepnyRuch(int n) {
  while (winner == false) {
    int n1 = n - 1;
    print('Wybierz liczbe dla wiersza od 0 do $n1');
    int row = int.parse(stdin.readLineSync() ?? "3");
    print('Wybierz liczbe dla kolumny od 0 do $n1');
    int col = int.parse(stdin.readLineSync() ?? "3");
    print("Player: $player");
    if(row > n1 || col > n1)
      print("Niepoprawna liczba");

    validMove(row, col);
    //zmiana gracza
    moveX = !moveX;
    print(gameBoard.join("\n"));
    checkWin(n, player);
    if (!winner) {
      if (moveX == false) {
        player = 'O';
      } else {
        player = 'X';
      }
  }

  if (winner == true) 
    print('$player wygral!');
}
}
//miejsce wolne czy zajete
void validMove(row, col){
  if(gameBoard[row][col] != '*'){
    print('Miejsce zajete');
  }
  else{
    gameBoard[row][col] = player;
  }
}
//plansza
void board(int n) {
  for (int i = 0; i < n; i++) {
    gameBoard.add([]);
    for (int j = 0; j < n; j++) {
      gameBoard[i].add("*");
    }
  }
}

void checkWin(int n, String x) {
  //poziom
  for (int j = 0; j < n; j++) {
    for (int i = 0; i <= n - 3; i++) {
      if (gameBoard[i][j] == x &&
          gameBoard[i + 1][j] == x &&
          gameBoard[i + 2][j] == x) {
        winner = true;
      }
    }
  }
  //pion
  for (int j = 0; j <= n - 3; j++) {
    for (int i = 0; i < n; i++) {
      if (gameBoard[i][j] == x &&
          gameBoard[i][j + 1] == x &&
          gameBoard[i][j + 2] == x) {
        winner = true;
      }
    }
  }
  //ukos w prawo
  for (int j = 0; j <= n - 3; j++) {
    for (int i = 0; i <= n - 3; i++) {
      if (gameBoard[i][j] == x &&
          gameBoard[i + 1][j + 1] == x &&
          gameBoard[i + 2][j + 2] == x) {
        winner = true;
      }
    }
  }
  //ukos w lewo
  for (int j = 0; j <= n - 3; j++) {
    for (int i = n - 1; i >= n - 3; i--) {
      if (gameBoard[i][j] == x &&
          gameBoard[i - 1][j + 1] == x &&
          gameBoard[i - 2][j + 2] == x) {
        winner = true;
      }
    }
  }
}
