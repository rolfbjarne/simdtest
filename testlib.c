#include <simd/simd.h>
#include <stdio.h>

void
CallMeDouble (vector_double4 arg)
{
	printf ("CallMeDouble (%f, %f, %f, %f)\n", arg [0], arg [1], arg [2], arg [3]);
}


void
CallMeFloat (vector_float4 arg)
{
	printf ("CallMeFloat (%f, %f, %f, %f)\n", arg [0], arg [1], arg [2], arg [3]);
}