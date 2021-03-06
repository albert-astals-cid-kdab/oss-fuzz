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
MAINTAINER alex.gaynor@gmail.com
RUN apt-get update && apt-get install -y mercurial automake autopoint cmake libtool nasm pkg-config
RUN hg clone http://hg.code.sf.net/p/graphicsmagick/code graphicsmagick || \
    hg clone http://hg.code.sf.net/p/graphicsmagick/code graphicsmagick || \
    hg clone http://hg.code.sf.net/p/graphicsmagick/code graphicsmagick

RUN git clone --depth 1 https://gitlab.com/libtiff/libtiff
RUN git clone --depth 1 https://github.com/webmproject/libwebp
RUN git clone --depth 1 https://github.com/madler/zlib
RUN git clone --depth 1 https://github.com/xz-mirror/xz
RUN git clone --depth 1 https://github.com/facebook/zstd
RUN git clone --depth 1 https://github.com/libjpeg-turbo/libjpeg-turbo
RUN git clone --depth 1 https://git.savannah.nongnu.org/r/freetype/freetype2
RUN git clone --depth 1 https://github.com/glennrp/libpng
RUN git clone --depth 1 https://github.com/mm2/Little-CMS
ADD http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz bzip2-1.0.6.tar.gz

WORKDIR graphicsmagick
COPY build.sh $SRC/
