using System;
using System.Runtime.InteropServices;
#if NET
using System.Runtime.Intrinsics;
#endif

struct StructA {
	public double A, B, C, D;
}

class C {
	[DllImport ("test.dylib", EntryPoint="CallMeDouble")]
	static extern void CallMeDoubleA (string msg, StructA arg);

#if NET
	[DllImport ("test.dylib", EntryPoint="CallMeFloat")]
	unsafe static extern void CallMeFloatB (string msg, Vector128<float>* arg);

	[DllImport ("test.dylib", EntryPoint="CallMeDouble")]
	unsafe static extern void CallMeDoubleB (string msg, Vector256<double>* arg);
#endif

	static void Main ()
	{
#if NET
		Console.WriteLine ($".NET: {System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture}");
#else
		Console.WriteLine ($"Mono: {System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture}");
#endif

		var a = new StructA { A = 1, B = 2, C = 3, D = 4 };
		CallMeDoubleA ("Plain struct (this is wrong, isn't supposed to work, but it might)", a);

#if NET
		unsafe {
			var b = Vector128.Create (1.0f, 2.0f, 3.0f, 4.0f);
			CallMeFloatB ("Vector128", &b);
		}

		unsafe {
			var b = Vector256.Create (1.0, 2.0, 3.0, 4.0);
			CallMeDoubleB ("Vector256", &b);
		}
#endif
	}
}
