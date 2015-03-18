##### exercise 1 #####

"Exercise 1 -------------" println

Builder := clone Object

Builder indentLevel := 0

Builder forward = method(
    writeln(indent(), "<", call message name, ">")
    indentLevel = indentLevel + 1
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(indent(), content))
    )
    indentLevel = indentLevel - 1
    writeln(indent(), "</", call message name, ">")
)

Builder indent := method(
    spaces := ""
    indentLevel repeat(write("  "))
    return spaces
)

Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript")
)

##### exercise 2 #####

"Exercise 2 -------------" println

curlyBrackets := method(
    call message arguments
)

{1,2,3,4,5} println
{"a", "b", "c", "d", "e"} println

##### exercise 3 #####

"Exercise 3 -------------" println

OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)
        
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map printAsAttributes := method(
    self foreach(k, v,
        write(" ", k, "=\"", v, "\"")
    )
)

Builder forward = method(
    write(indent(), "<", call message name)
    indentLevel = indentLevel + 1
    isFirst := true
    call message arguments foreach(
        arg,
        if(isFirst, 
            if(arg name == "curlyBrackets", (self doMessage(arg)) printAsAttributes); write(">\n"); isFirst = false
        )

        content := self doMessage(arg)
        if(content type == "Sequence", writeln(indent(), content))
    )
    indentLevel = indentLevel - 1
    writeln(indent(), "</", call message name, ">")
)

s := File with("builderSyntax.txt") openForReading contents
doString(s)