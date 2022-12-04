import java.io.File

fun readFile(fileName: String): String {
    return File(fileName).readText()
}

fun main() {

    var fileName = "input.txt"
    var fileContent = readFile(fileName)
    var containmentCount = 0
    var overlapCount = 0
    // loop through the file content
    for (line in fileContent.lines()) {
        // split each line by comma
        val (rangeA, rangeB) = line.split(",")

        val (minA, maxA) = rangeA.split("-")
        val (minB, maxB) = rangeB.split("-")

        // check if one range is in the other
        if((minA.toInt() >= minB.toInt() && maxA.toInt() <= maxB.toInt()) || (minB.toInt() >= minA.toInt() && maxB.toInt() <= maxA.toInt())) {
            containmentCount++
        }
        
        // check if the ranges overlap
        if((minA.toInt() <= maxB.toInt() && maxA.toInt() >= minB.toInt()) || (minB.toInt() <= maxA.toInt() && maxB.toInt() >= minA.toInt())) {
            overlapCount++
        }
        
        println("Number of pairs that fully contain the other: $containmentCount")
        println("Number of pairs that overlap: $overlapCount")
        //print blank line
        println()
    }
}