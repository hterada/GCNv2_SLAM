cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(check_gpu)

find_package(CUDA REQUIRED)

CUDA_ADD_EXECUTABLE(check_gpu check_gpu.cu)
