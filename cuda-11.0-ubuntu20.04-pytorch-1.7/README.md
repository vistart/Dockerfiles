# Preparation

1. You should prepare the `torch-1.7.1+cu110-cp38-cp38-linux_x86_64.whl`, `torchvision-0.8.2+cu110-cp38-cp38-linux_x86_64.whl` and `torchaudio-0.7.2-cp38-cp38-linux_x86_64.whl` first and place them under the current directory.
2. Run the building command `docker build .`, and you're allowed to attach your tag just like `docker build . -t vistart/pvcnn`.