V := Object clone
Car := V clone
V xx := method("invoking method xx on V" println)
c := Car clone
"c is a #{c type}" interpolate println
c xx