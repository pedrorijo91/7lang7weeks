def gameStatus(game: Board) = {
  game.getLines.foreach(line => if(line.forall(c => c == line(0))) println("Winner is: " + line(0)))

  game.getCols.foreach(col => if(col.forall(c => c == col(0))) println("Winner is: " + col(0)))

  val diagLeftUp = game.getDiagLeftUp
  if(diagLeftUp.forall(c => c == diagLeftUp(0))) println("Winner is: " + diagLeftUp(0))

  val diagLeftDown = game.getDiagLeftDown
  if(diagLeftDown.forall(c => c == diagLeftDown(0))) println("Winner is: " + diagLeftDown(0))
}

gameStatus(new Board(List(List('X','X','X'),List('X','X','X'),List('X','X','X'))))
gameStatus(new Board(List(List('X','O','X'),List('X','O','X'),List('X','O','X'))))
gameStatus(new Board(List(List('X','*','*'),List('*','X','*'),List('*','*','X'))))

class Board(val board: List[List[Char]]) {
  def getLine(index: Int): List[Char] = board(index)
  def getLines: List[List[Char]] = board

  def getCol(index: Int): List[Char] = board.flatMap(line => line(index).toString)
  def getCols: List[List[Char]] = (for (i <- 0 to 2) yield getCol(i)).toList

  def getDiagLeftUp: List[Char] = List(board(0)(0), board(1)(1), board(2)(2))
  def getDiagLeftDown: List[Char] = List(board(2)(0), board(1)(1), board(0)(2))
}


// Exercise 2 already done in previous mini personal project
// check at https://github.com/pedrorijo91/tic-tac-toe-Scala