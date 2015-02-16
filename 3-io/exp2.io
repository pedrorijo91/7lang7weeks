

List2D := List clone

dim := method(x,y, List2D clone setSize(y) mapInPlace(_, List clone setSize(x)) )

dim(5,2) println

List2D set := method(x,y,value, at(y) atPut(x,value))
List2D get := method(x,y, at(y) at(x))

l := dim(5,2)
l set(2,1,"foo")
l get(2,1) println