##### exercise 1 #####

"Exercise 1 -------------" println

fib := method(nth,
  n1 := 1;
  n2 := 1;
  res := 1;
  for(i, 3, nth,
    oldRes := res;
    res = n1 + n2;
    n1 = n2;
    n2 = res;
  );
  res
)

fibRec := method(nth, if(nth == 0, 0,
                        if(nth == 1 or nth == 2, 1, fibRec(nth -2) + fibRec(nth - 1))))

for(nth, 0, 10, "for nth = #{nth}:\n\t result_rec = #{fibRec(nth)} vs #{fib(nth)} on result_loop" interpolate println)

##### exercise 2 #####

"Exercise 2 -------------" println

div := Number getSlot("/")
Number / = method(n, if(n == 0, 0, div(n)))

3/0 println

##### exercise 3 #####

"Exercise 3 -------------" println

List sum2d := method(flatten sum)

l2d := list(
          list(1, 2, 3),
          list(4, 5, 6),
          list(7, 8, 9))
l2d sum2d println


##### exercise 4 #####

"Exercise 4 -------------" println

List avg := method(
  notNumber := select(asNumber() isNan())
  if(notNumber size > 0,  Exception raise("the list should contain only numbers: #{notNumber}" interpolate), average))

l2d flatten avg println
#list ("a", 3, "b", 4, 5) avg println

##### exercise 5 #####

"Exercise 5 -------------" println

List2D := List clone

dim := method(x,y, List2D clone setSize(y) mapInPlace(_, List clone setSize(x)) )

dim(5,2) println

List2D set := method(x,y,value, at(y) atPut(x,value))
List2D get := method(x,y, at(y) at(x))

l := dim(5,2)
l set(2,1,"foo")
l get(2,1) println

##### exercise 6 #####

"Exercise 6 -------------" println

List2D transpose := method(
  other:= dim(size, at(0) size)
  foreach(y,row, row foreach(x,value, other set(y,x,value)))
  other
)

##### exercise 7 #####

"Exercise 7 -------------" println

filenamePrint := "matrix.txt"

printMatrixToFile := method(matrix,
                f := File with(filenamePrint)
                f remove
                f openForUpdating
                matrix foreach(i, l, f write(l join(","), "\n"))
                f close
                )

m := list(list("a","b"), list("c", "d"))
printMatrixToFile(m)
"matrix printed to file #{filenamePrint}" interpolate println

filenameRead := "matrix.txt"

readMatrixFromFile := method(filename,
                f := File with(filename)
                f openForReading
                lines := f readLines
                f close
                m := list()
                lines foreach(i, l, m append (l split(",")))
                m
                )

mx := readMatrixFromFile(filenameRead)
"matrix read from file #{filenameRead}:" interpolate println
mx println

##### exercise 8 #####

"Exercise 8 -------------" println

guess := method(max,
  "Guess a number" println;
  n := (Random value * max) ceil;
  userTry := -1;
  "debug: #{n}" interpolate println
  while(userTry != n,
    "Try to guess the secret number (number between 0 and #{max})" interpolate println
    userTry := (File standardInput readLine) asNumber()
    "You have tried with #{userTry}" interpolate println
    if(userTry != n, if(userTry > n, "smaller", "bigger") println)
  )
  "You have found the secret number !" println
)

guess(10)
