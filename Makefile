all:
	dune build oce_runner.exe
	mkdir -p bin
	cp _build/default/oce_runner.exe bin/

clean:
	dune clean
	git clean -dfXq
