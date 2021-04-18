.PHONY: all static dynamic
all: static

static:
	cd mylib && gcc -O2 -c add.c
	cd mylib && ar -rcs libadd.a add.o
	mv ./mylib/libadd.a ./libadd.a
	go build -ldflags "-s -linkmode external -extldflags -static" main.go
	rm ./mylib/add.o
	rm ./libadd.a
	file ./main
	./main

dynamic:
	cd ./mylib/ && gcc -O2 -shared -o libadd.so -fPIC add.c
	mv ./mylib/libadd.so ./libadd.so
	go build -ldflags "-s -w" main.go
	file ./main
	LD_LIBRARY_PATH=.:${LD_LIBRARY_PATH} ./main
