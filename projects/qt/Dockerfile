# Copyright 2018 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

FROM gcr.io/oss-fuzz-base/base-builder
MAINTAINER albert.astals.cid@kdab.com
RUN git clone --depth 1 git://code.qt.io/qt/qtbase.git --branch dev
RUN git clone --depth 1 https://github.com/glennrp/libpng.git && \
    find libpng -name "*.png" | grep -v crashers | xargs zip $SRC/qimage_fuzzer_seed_corpus.zip && \
    cp libpng/contrib/oss-fuzz/png.dict $SRC/qimage_fuzzer.dict && \
    rm -rf libpng
COPY build.sh $SRC
COPY qimage_fuzzer.cc $SRC
WORKDIR qt




