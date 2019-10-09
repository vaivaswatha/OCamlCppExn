.PHONY: all dune clean

LFLAGS 				:=
ifeq ($(OS),Windows_NT)

else
	LFLAGS += -cclib exn_thrower.o -cclib -lstdc++
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		OSFLAGS += -cclib -Xlinker -cclib -keep_dwarf_unwind
	endif
endif

# Default is to build using ocamlbuild
all:
	mkdir -p _build
	cc -c cpp/exn_thrower.cpp -o _build/exn_thrower.o
	ocamlbuild oce_runner.native -r -use-ocamlfind -package ctypes.foreign -lflags "$(LFLAGS)"
	mkdir -p bin
	mv oce_runner.native bin/oce_runner.exe

# Build using dune
dune:
	dune build oce_runner.exe
	mkdir -p bin
	cp _build/default/oce_runner.exe bin/

clean:
	dune clean
	git clean -dfXq
