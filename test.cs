using System;
using System.Runtime.InteropServices;

struct StructA {
	public double A, B, C, D;
}

class C {
	[DllImport ("libtest.dylib", EntryPoint="CallMe")]
	static extern void CallMe (StructA arg);

	static void Main ()
	{
		var a = new StructA { A = 1, B = 2, C = 3, D = 4 };
		CallMe (a);
	}
}
