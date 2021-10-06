Q=$(if $(V),,@)

BE_QUIET=/verbosity:quiet --nologo -consoleLoggerParameters:NoSummary >/dev/null

run-all run:
	$(Q) $(MAKE) run-dotnet
	$(Q) $(MAKE) run-mono

run-dotnet:
	$(Q) $(MAKE) run-dotnet-osx-x64
	$(Q) $(MAKE) run-dotnet-osx-arm64

run-dotnet-%: libtest.dylib
	$(Q) echo "------------------------------"
	$(Q) echo "Executing on .NET/$*"
	$(Q) mkdir -p bin/Debug/net6.0/$*/
	$(Q) cp *.dylib bin/Debug/net6.0/$*/
	$(Q) dotnet publish --runtime $* --self-contained true /bl:$@.binlog $(BE_QUIET)
	$(Q) ./bin/Debug/net6.0/$*/publish/simd

run-mono: libtest.dylib test.exe
	$(Q) echo "------------------------------"
	$(Q) echo "Executing on Mono/x86_64"
	$(Q) mono test.exe

testlib.o: testlib.c Makefile
	$(Q) clang -arch arm64 -arch x86_64 -o$@ -c $<

libtest.dylib: testlib.o
	$(Q) clang -shared -o$@ $< -arch arm64 -arch x86_64

test.exe: test.cs
	$(Q) csc $< /out:$@ /nologo
