#include <iostream>
#include <quickbam/slicer.h>
#include <quickbam/mbgzf.h>

__global__ void hithere();

int main(int argc, char** argv) {
    auto bam_path = argv[1];
    auto bai_path = std::string(bam_path) + ".bai";

    file_slicer_t bam_slicer(bam_path);

    auto bgzf_it = bgzf_slicer_iterator_t<file_slicer_t>(bam_slicer);
    auto bgzf_end = bgzf_it.end();

    while (bgzf_it != bgzf_end) {
        //std::cout << "Hi there" << std::endl;
        bgzf_it++;
    }

    hithere<<<1,1>>>();
    cudaDeviceSynchronize();
}
