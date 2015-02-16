m := list(list("a","b"), list("c", "d"))

m println

printMatrix := method(matrix,
                matrix foreach(i, l, l join(",") println)
                )

printMatrix(m)

m := list(list("a","b"), list("c", "d"))

printMatrixToFile := method(matrix,
                f := File with("matrix.txt")
                f remove
                f openForUpdating
                matrix foreach(i, l, f write(l join(","), "\n"))
                f close
                )


printMatrixToFile(m)


readMatrixFromFile := method(filename,
                f := File with(filename)
                f openForReading
                lines := f readLines
                f close
                m := list()
                lines foreach(i, l, m append (l split(",")))
                m
                )

readMatrixFromFile("matrix.txt")
