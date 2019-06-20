# This file is part of NIT ( http://www.nitlanguage.org ).
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

NITC ?= nitc
NITLS ?= nitls
NITUNIT ?= nitunit
NITDOC ?= nitdoc

.PHONY: all
all: bin/listener bin/web

bin/listener: $(shell $(NITLS) -M src/listener.nit)
	mkdir -p bin/
	$(NITC) src/listener.nit -o bin/listener

bin/web: $(shell $(NITLS) -M src/web.nit)
	mkdir -p bin/
	$(NITC) src/web.nit -o bin/web

.PHONY: check
check:
	$(NITUNIT) .

.PHONY: doc
doc:
	$(NITDOC) . -o doc/

.PHONY: clean
clean:
	rm -rf bin/
	rm -rf doc/
