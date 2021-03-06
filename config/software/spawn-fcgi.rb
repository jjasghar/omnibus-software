#
# Copyright 2012-2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "spawn-fcgi"
default_version "1.6.3"

dependency "fcgi"
dependency "fcgiwrap"

source url: "http://www.lighttpd.net/download/spawn-fcgi-#{version}.tar.gz",
       md5: "6d75f9e9435056fa1e574d836d823cd0"

relative_path "spawn-fcgi-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure" \
          " --prefix=#{install_dir}/embedded", env: env

  command "make -j #{max_build_jobs}", env: env
  command "make install", env: env
end
