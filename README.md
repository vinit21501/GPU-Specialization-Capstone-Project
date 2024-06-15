# GPU-Specialization-Capstone-Project

CUDA Vector Addition
This project demonstrates GPU acceleration using CUDA for a simple vector addition operation. It includes a CUDA kernel written in C/C++ to add two vectors in parallel on NVIDIA GPUs.

Features
Adds two integer arrays (a and b) element-wise to produce an output array (c).
Demonstrates CUDA kernel execution for parallel computation on GPU.
Prerequisites
NVIDIA GPU with CUDA support.
CUDA Toolkit installed. You can download it from NVIDIA's CUDA Toolkit.
C++ compiler that supports CUDA (e.g., nvcc provided by CUDA Toolkit).
Project Structure
vector_add.cu: CUDA kernel implementation for vector addition.
main.cpp: Host code to manage memory, call CUDA kernel, and verify results.
README.md: This file, providing an overview, setup instructions, and usage details.
Compilation and Execution
Clone the repository:

bash
Copy code
git clone https://github.com/vinit21501/GPU-Specialization-Capstone-Project.git
cd GPU-Specialization-Capstone-Project
Compile the program:

Use nvcc (NVIDIA CUDA Compiler) to compile the CUDA kernel (vector_add.cu) along with the host code (main.cpp):

bash
Copy code
nvcc -o vector_add vector_add.cu main.cpp
Run the executable:

Execute the compiled program:

bash
Copy code
./vector_add
This will run the CUDA vector addition program, which adds two arrays in parallel on the GPU and prints the results.
