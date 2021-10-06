#include <simd/simd.h>
#include <stdio.h>

void
CallMe (vector_double4 arg)
{
	printf ("CallMe (%f, %f, %f, %f)\n", arg [0], arg [1], arg [2], arg [3]);
}
