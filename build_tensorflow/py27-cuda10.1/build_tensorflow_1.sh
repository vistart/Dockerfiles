docker run -itd --runtime=nvidia --rm --name build_tensorflow_1_py27_cuda10.1 -w /root/tensorflow -v $PWD:/mnt -e HOST_PERMS="$(id -u):$(id -g)" vistart/build_tensorflow:1.15-py27-cuda10.1
docker exec -it build_tensorflow_1_py27_cuda10.1 git checkout r1.15
docker exec -it build_tensorflow_1_py27_cuda10.1 bazel build //tensorflow/tools/pip_package:build_pip_package
docker exec -it build_tensorflow_1_py27_cuda10.1 ./bazel-bin/tensorflow/tools/pip_package/build_pip_package /mnt
