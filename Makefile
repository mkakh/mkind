_build/default/mkind.exe: mkind.ml
	dune build mkind.exe
	ln -sf _build/default/mkind.exe ./mkind

clean:
	rm -rvf _build
