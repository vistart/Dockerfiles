docker run -itd --runtime=nvidia --rm --name build_tensorflow_2_py37_cuda10.2-tf2 -w /root/tensorflow -v "$PWD":/mnt -e HOST_PERMS="$(id -u):$(id -g)" vistart/build_tensorflow:py37-cuda10.2-tf2
docker exec -it build_tensorflow_2_py37_cuda10.2-tf2 bazel build //tensorflow/tools/pip_package:build_pip_package
docker exec -it build_tensorflow_2_py37_cuda10.2-tf2 ./bazel-bin/tensorflow/tools/pip_package/build_pip_package /mnt
docker stop build_tensorflow_2_py37_cuda10.2-tf2
