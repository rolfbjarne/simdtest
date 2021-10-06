using System;
using System.Runtime.InteropServices;
#if NET
using System.Runtime.Intrinsics;
#endif

struct StructA {
	public double A, B, C, D;
}

class C {
	[DllImport ("libtest.dylib", EntryPoint="CallMeDouble")]
	static extern void CallMeDoubleA (StructA arg);

#if NET
	[DllImport ("libtest.dylib", EntryPoint="CallMeFloat")]
	unsafe static extern void CallMeFloatB (Vector128<float>* arg);

	[DllImport ("libtest.dylib", EntryPoint="CallMeDouble")]
	static extern void CallMeDoubleB (Vector256<double> arg);
#endif

	static void Main ()
	{
		Console.WriteLine (System.Runtime.InteropServices.RuntimeInformation.ProcessArchitecture);

		var a = new StructA { A = 1, B = 2, C = 3, D = 4 };
		CallMeDoubleA (a);

#if NET
		unsafe {
			var b = Vector128.Create (1.0f, 2.0f, 3.0f, 4.0f);
			CallMeFloatB (&b);
		}

		// {
		// 	var b = Vector256.Create (1.0, 2.0, 3.0, 4.0);
		// 	CallMeDoubleB (b);
		// }
#endif
	}
}
