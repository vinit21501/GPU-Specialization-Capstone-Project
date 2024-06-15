#include <iostream>

extern "C" void cuda_vector_add(int *h_a, int *h_b, int *h_c, int n);

int main() {
    int n = 100000; // Size of vectors

    // Allocate memory for vectors on host (CPU)
    int *h_a = new int[n];
    int *h_b = new int[n];
    int *h_c = new int[n];

    // Initialize input vectors
    for (int i = 0; i < n; ++i) {
        h_a[i] = i;
        h_b[i] = i * 2;
    }

    // Call CUDA function for vector addition
    cuda_vector_add(h_a, h_b, h_c, n);

    // Verify results (optional)
    /*
    for (int i = 0; i < n; ++i) {
        std::cout << h_a[i] << " + " << h_b[i] << " = " << h_c[i] << std::endl;
    }
    */

    // Free host memory
    delete[] h_a;
    delete[] h_b;
    delete[] h_c;

    return 0;
}
