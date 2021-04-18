package main

/*
#cgo CFLAGS: -I.
#cgo LDFLAGS: -L. -ladd
#include "add.h"
*/
import "C"
import "fmt"

func main() {
	r := C.Add(12, 30)
	fmt.Println(r)
}
