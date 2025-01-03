package main

import (
	"fmt"
	"os"

	"github.com/qiuzhanghua/common/hf"
)

func main() {
	if len(os.Args) < 2 {
		os.Exit(-1)
	}
	modelName := os.Args[1]

	answer, _ := hf.HfModelPath(modelName)

	fmt.Print(answer)
}
