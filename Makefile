run-all:
	$(MAKE) run-dotnet
	$(MAKE) run-mono

run-dotnet:
	$(MAKE) run-dotnet-x64
	$(MAKE) run-dotnet-arm64

run-dotnet-x64: libtest.dylib
	mkdir -p bin/Debug/net6.0/osx-x64/
	cp *.dylib bin/Debug/net6.0/osx-x64/
	dotnet run --runtime osx-x64 --self-contained true

run-dotnet-arm64: libtest.dylib
	mkdir -p bin/Debug/net6.0/osx-arm64/
	cp *.dylib bin/Debug/net6.0/osx-arm64/
	dotnet run --runtime osx-arm64 --self-contained true

run-mono: libtest.dylib test.exe
	mono test.exe

testlib.o: testlib.c Makefile
	clang -arch arm64 -arch x86_64 -o$@ -c $<

libtest.dylib: testlib.o
	clang -shared -o$@ $< -arch arm64 -arch x86_64

test.exe: test.cs
	csc $< /out:$@