FROM scratch as step1

COPY mnist.onnx models/mnist.onnx

FROM step1
# second layer
COPY README.md README.md
