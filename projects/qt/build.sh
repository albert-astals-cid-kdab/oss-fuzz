#!/bin/bash -eu
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

pushd $SRC/qtbase
sed -i -e "s/QMAKE_CXXFLAGS    += -stdlib=libc++/QMAKE_CXXFLAGS    += -stdlib=libc++ $CXXFLAGS/g" mkspecs/linux-clang-libc++/qmake.conf
sed -i -e "s/QMAKE_LFLAGS      += -stdlib=libc++/QMAKE_LFLAGS      += -stdlib=libc++ $CXXFLAGS/g" mkspecs/linux-clang-libc++/qmake.conf
./configure --glib=no --libpng=qt -developer-build -opensource -confirm-license -static -no-opengl -no-icu -platform linux-clang-libc++
make -j$(nproc) sub-src

$CXX $CXXFLAGS -fPIC -std=c++11 -I $SRC/qtbase/include/QtGui/ -I $SRC/qtbase/include/QtCore/ -I $SRC/qtbase/include/ \
    $SRC/qimage_fuzzer.cc -o $OUT/qimage_fuzzer \
    -lFuzzingEngine -L $SRC/qtbase/lib -lQt5Gui -lQt5Core -lqtlibpng -lqtharfbuzz -lm -lqtpcre2 -ldl -lpthread

mv $SRC/{*.zip,*.dict} $OUT

if [ ! -f "${OUT}/qimage_fuzzer_seed_corpus.zip" ]; then
  echo "missing seed corpus"
  exit 1
fi

if [ ! -f "${OUT}/qimage_fuzzer.dict" ]; then
  echo "missing dictionary"
  exit 1
fi
