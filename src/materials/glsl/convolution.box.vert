uniform vec2 texelSize;

#if KERNEL_SIZE == 3

	// Optimized 3x3
	varying vec2 vUv00, vUv01, vUv02;
	varying vec2 vUv03, vUv04, vUv05;
	varying vec2 vUv06, vUv07, vUv08;

#elif KERNEL_SIZE == 5 && MAX_VARYING_VECTORS >= 13

	// Optimized 5x5
	varying vec2 vUv00, vUv01, vUv02, vUv03, vUv04;
	varying vec2 vUv05, vUv06, vUv07, vUv08, vUv09;
	varying vec2 vUv10, vUv11, vUv12, vUv13, vUv14;
	varying vec2 vUv15, vUv16, vUv17, vUv18, vUv19;
	varying vec2 vUv20, vUv21, vUv22, vUv23, vUv24;

#else

	varying vec2 vUv;

#endif

void main() {

	vec2 uv = position.xy * 0.5 + 0.5;

	#if KERNEL_SIZE == 3

		// Optimized 3x3
		vUv00 = uv + texelSize * vec2(-1.0, -1.0);
		vUv01 = uv + texelSize * vec2(0.0, -1.0);
		vUv02 = uv + texelSize * vec2(1.0, -1.0);

		vUv03 = uv + texelSize * vec2(-1.0, 0.0);
		vUv04 = uv;
		vUv05 = uv + texelSize * vec2(1.0, 0.0);

		vUv06 = uv + texelSize * vec2(-1.0, 1.0);
		vUv07 = uv + texelSize * vec2(0.0, 1.0);
		vUv08 = uv + texelSize * vec2(1.0, 1.0);

	#elif KERNEL_SIZE == 5

		// Optimized 5x5
		vUv00 = uv + texelSize * vec2(-2.0, -2.0);
		vUv01 = uv + texelSize * vec2(-1.0, -2.0);
		vUv02 = uv + texelSize * vec2(0.0, -2.0);
		vUv03 = uv + texelSize * vec2(1.0, -2.0);
		vUv04 = uv + texelSize * vec2(2.0, -2.0);

		vUv05 = uv + texelSize * vec2(-2.0, -1.0);
		vUv06 = uv + texelSize * vec2(-1.0, -1.0);
		vUv07 = uv + texelSize * vec2(0.0, -1.0);
		vUv08 = uv + texelSize * vec2(1.0, -1.0);
		vUv09 = uv + texelSize * vec2(2.0, -1.0);

		vUv10 = uv + texelSize * vec2(-2.0, 0.0);
		vUv11 = uv + texelSize * vec2(-1.0, 0.0);
		vUv12 = uv;
		vUv13 = uv + texelSize * vec2(1.0, 0.0);
		vUv14 = uv + texelSize * vec2(2.0, 0.0);

		vUv15 = uv + texelSize * vec2(-2.0, 1.0);
		vUv16 = uv + texelSize * vec2(-1.0, 1.0);
		vUv17 = uv + texelSize * vec2(0.0, 1.0);
		vUv18 = uv + texelSize * vec2(1.0, 1.0);
		vUv19 = uv + texelSize * vec2(2.0, 1.0);

		vUv20 = uv + texelSize * vec2(-2.0, 2.0);
		vUv21 = uv + texelSize * vec2(-1.0, 2.0);
		vUv22 = uv + texelSize * vec2(0.0, 2.0);
		vUv23 = uv + texelSize * vec2(1.0, 2.0);
		vUv24 = uv + texelSize * vec2(2.0, 2.0);

	#else

		// General case
		vUv = uv;

	#endif

	gl_Position = vec4(position.xy, 1.0, 1.0);

}
