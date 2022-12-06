package main

import (
	"fmt"
	"os"
	"bufio"
	"regexp"
	"strconv"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	f, err := os.Open("input.txt")
	// create an array of arrays of strings
	var crates [9][]string
	var crates_2 [9][]string
	check(err)
	defer f.Close()
	re := regexp.MustCompile("[0-9]+")

	scanner := bufio.NewScanner(f)
	for scanner.Scan() {
		line := scanner.Text()
		for i, char := range line {
			if string(char) == "[" {
				crates[i/4] = append(crates[i/4], string(line[i+1]))
				crates_2[i/4] = append(crates_2[i/4], string(line[i+1]))
			}
			if string(char) == "m" {
				break
			}
		}
		if len(line) > 0 && string(line[0]) == "m" {
			var values = re.FindAllString(line, -1)
			var amount,from,to = values[0],values[1],values[2]
			amountInt, _ := strconv.Atoi(amount)
			fromInt, _ := strconv.Atoi(from)
			toInt, _ := strconv.Atoi(to)
			for i := 0; i < amountInt; i++ {
				// extract the first element of the array
				crate := crates[fromInt-1][0]
				// remove the first element of the array
				crates[fromInt-1] = crates[fromInt-1][1:]
				// prepend the crate to the destination array
				crates[toInt-1] = append([]string{crate}, crates[toInt-1]...)

			}
			crate_2 := crates_2[fromInt-1][0:amountInt]
			crates_2[fromInt-1] = crates_2[fromInt-1][amountInt:]
			for i := amountInt-1; i >= 0; i-- {
				crates_2[toInt-1] = append([]string{crate_2[i]}, crates_2[toInt-1]...)
			}
		}
	}
	for i := 0; i < len(crates); i++ {
		fmt.Print(crates[i][0])
	}
	fmt.Println()
	for i := 0; i < len(crates_2); i++ {
		fmt.Print(crates_2[i][0])
	}
}