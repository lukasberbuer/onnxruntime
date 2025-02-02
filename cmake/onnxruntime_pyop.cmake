# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
onnxruntime_add_static_library(onnxruntime_pyop "${ONNXRUNTIME_ROOT}/core/language_interop_ops/pyop/pyop.cc")
add_dependencies(onnxruntime_pyop ${onnxruntime_EXTERNAL_DEPENDENCIES})
onnxruntime_add_include_to_target(onnxruntime_pyop onnxruntime_common onnxruntime_graph onnxruntime_framework onnx onnx_proto ${PROTOBUF_LIB} flatbuffers ${GSL_TARGET} Boost::mp11)
target_include_directories(onnxruntime_pyop PRIVATE ${ONNXRUNTIME_ROOT} ${eigen_INCLUDE_DIRS})
onnxruntime_add_include_to_target(onnxruntime_pyop Python::Module Python::NumPy)
if (TARGET Python::Python)
  target_link_libraries(onnxruntime_pyop PRIVATE Python::Python)
else()
  target_link_libraries(onnxruntime_pyop PRIVATE Python::Module)
endif()
