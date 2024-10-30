FROM scratch as step1

COPY mnist.onnx models/mnist.onnx

FROM step1

COPY INFO.md models/README.md
