#include <simd/simd.h>
#include <stdio.h>

void
CallMeDouble (const char *message, vector_double4 arg)
{
	if (arg [0] == 1.0 && arg [1] == 2.0 && arg [2] == 3.0 && arg [3] == 4.0)
		printf ("✅ ");
	else
		printf ("❌ ");
	printf ("CallMeDouble (%f, %f, %f, %f): %s\n", arg [0], arg [1], arg [2], arg [3], message);
}


void
CallMeFloat (const char *message, vector_float4 arg)
{
	if (arg [0] == 1.0 && arg [1] == 2.0 && arg [2] == 3.0 && arg [3] == 4.0)
		printf ("✅ ");
	else
		printf ("❌ ");
	printf ("CallMeFloat (%f, %f, %f, %f): %s\n", arg [0], arg [1], arg [2], arg [3], message);
}