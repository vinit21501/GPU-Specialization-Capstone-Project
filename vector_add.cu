#include <stdio.h>

// CUDA kernel to add two vectors
__global__ void vectorAdd(int *a, int *b, int *c, int n) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Bounds check
    if (tid < n) {
        c[tid] = a[tid] + b[tid];
    }
}

// Host function to initialize vectors and call CUDA kernel
extern "C" void cuda_vector_add(int *h_a, int *h_b, int *h_c, int n) {
    int *d_a, *d_b, *d_c; // Device arrays

    // Allocate memory on GPU
    cudaMalloc((void **)&d_a, n * sizeof(int));
    cudaMalloc((void **)&d_b, n * sizeof(int));
    cudaMalloc((void **)&d_c, n * sizeof(int));

    // Copy input vectors from host to GPU memory
    cudaMemcpy(d_a, h_a, n * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, h_b, n * sizeof(int), cudaMemcpyHostToDevice);

    // Define block size and grid size
    int block_size = 256;
    int grid_size = (n + block_size - 1) / block_size;

    // Launch CUDA kernel
    vectorAdd<<<grid_size, block_size>>>(d_a, d_b, d_c, n);

    // Copy result vector from GPU to host memory
    cudaMemcpy(h_c, d_c, n * sizeof(int), cudaMemcpyDeviceToHost);

    // Free GPU memory
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);
}
