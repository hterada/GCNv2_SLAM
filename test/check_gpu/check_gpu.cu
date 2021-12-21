#include <cuda_runtime.h>
#include <cstdio>

int main()
{
  int count = 0;
  auto result_count = cudaGetDeviceCount(&count);
  if (cudaSuccess != result_count) {
    std::printf("Error:result_count=%d\n", result_count );
    return -1;
  }
  if (count == 0) return -1;
  for (int device = 0; device < count; ++device)
  {
    cudaDeviceProp prop;
    auto result = cudaGetDeviceProperties(&prop, device);
    if (cudaSuccess == result) {
      std::printf("%d.%d\n", prop.major, prop.minor);
    } else {
      std::printf("Error:result=%d\n", result);
    }
  }
  return 0;
}

