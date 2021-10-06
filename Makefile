testlib.o: testlib.c Makefile
	clang -arch arm64 -arch x86_64 -o$@ -c $<

libtest.dylib: testlib.o
	clang -shared -o$@ $<

test.exe: test.cs
	csc $< /out:$@