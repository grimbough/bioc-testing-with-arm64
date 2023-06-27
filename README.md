# Testing Bioconductor Packages on Linux ARM64

## Docker container

The docker file found here produces a modified version of the 
[Bioconductor:devel](https://github.com/Bioconductor/bioconductor_docker/pkgs/container/bioconductor/102293490?tag=devel-amd64)
docker image which has TinyTex pre-installed.  This allows use to compile the
package manual pages and and PDF vignettes during testing.  Installing TinyTex
and the required LaTeX packages takes approximately 10 minutes on our emulated
system, so there is a responsiveness benefit to using an image with it
already installed.

## Example Workflow

An example workflow can be found in [.github/workflows/test-package-arm64.yml](.github/workflows/test-package-arm64.yml).
This demonstrates how to use the QEMU emulator and the ARM64 Docker image described above, to first install 
and cache package dependenceies, followed bty running the standard R pacakge tests in a manner similar to the 
Bioconductor Build System.

## Example Package

The folder [examplePKG](examplePKG) contains a small R package that is testsed by the example workflow.

