docker run -itd --runtime=nvidia --rm --name build_tensorflow_2_py37_cuda10.1 -w /root/tensorflow -v "$PWD":/mnt -e HOST_PERMS="$(id -u):$(id -g)" vistart/build_tensorflow:py37-cuda10.1
docker exec -it build_tensorflow_2_py37_cuda10.1 git checkout r2.0
docker exec -it build_tensorflow_2_py37_cuda10.1 cp /mnt/build_tensorflow/.tf_configure.bazelrc.py37 .tf_configure.bazelrc
docker exec -it build_tensorflow_2_py37_cuda10.1 bazel build //tensorflow/tools/pip_package:build_pip_package
docker exec -it build_tensorflow_2_py37_cuda10.1 ./bazel-bin/tensorflow/tools/pip_package/build_pip_package /mnt
docker stop build_tensorflow_2_py37_cuda10.1
