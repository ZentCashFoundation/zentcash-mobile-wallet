LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := ZentCash_jni
LOCAL_SRC_FILES := ZentCash.cpp crypto.cpp crypto-ops.cpp crypto-ops-data.cpp hash.cpp keccak.cpp
LOCAL_LDLIBS := -llog
include $(BUILD_SHARED_LIBRARY)
