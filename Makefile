run-dotnet: libtest.dylib
	dotnet run

run-dotnet-arm64: libtest.dylib
	mkdir -p bin/Debug/net6.0/osx-arm64/
	cp *.dylib bin/Debug/net6.0/osx-arm64/
	dotnet run --runtime osx-arm64

run-mono: libtest.dylib test.exe
	mono test.exe

testlib.o: testlib.c Makefile
	clang -arch arm64 -arch x86_64 -o$@ -c $<

libtest.dylib: testlib.o
	clang -shared -o$@ $<

test.exe: test.cs
	csc $< /out:$@