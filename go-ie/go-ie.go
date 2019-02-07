package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
)

func main() {
	path := os.Args[1]
	file, err := os.Open(path)

	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	pattern := regexp.MustCompile(`([^c]|^)ei`)

	for scanner.Scan() {
		if !isValid(scanner.Text(), pattern) {
			fmt.Println(scanner.Text())
		}
	}
}

func isValid(s string, pattern *regexp.Regexp) bool {
	return !pattern.MatchString(s)
}
