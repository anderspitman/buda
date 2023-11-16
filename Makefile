NVCC=nvcc
NVCOMP=/opt/nvidia/nvcomp

buda: bam.cu main.cu
	NVCC_PREPEND_FLAGS='-ccbin g++-12' $(NVCC) -Xcompiler -fopenmp -g -I $(NVCOMP)/include -L $(NVCOMP)/lib -o $@ $^ -lquickbam -ltbb -lnvcomp

clean:
	rm buda
