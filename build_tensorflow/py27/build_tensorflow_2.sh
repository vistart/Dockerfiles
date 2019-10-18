docker run -itd --runtime=nvidia --rm --name build_tensorflow_2_py27_cuda10.0 -w /root/tensorflow -v "$PWD":/mnt -e HOST_PERMS="$(id -u):$(id -g)" vistart/build_tensorflow:1.15-py27-cuda10.0
docker exec -it build_tensorflow_2_py27_cuda10.0 git checkout r2.0
docker exec -it build_tensorflow_2_py27_cuda10.0 cp /mnt/build_tensorflow/.tf_configure.bazelrc.py27 .tf_configure.bazelrc
docker exec -it build_tensorflow_2_py27_cuda10.0 bazel build //tensorflow/tools/pip_package:build_pip_package
docker exec -it build_tensorflow_2_py27_cuda10.0 ./bazel-bin/tensorflow/tools/pip_package/build_pip_package /mnt
