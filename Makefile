export JDK_16_x64 = $(CURDIR)/../../debroot/usr/lib/jvm/java-6-openjdk-amd64/
export JDK_18_x64 = $(CURDIR)/../../debroot/usr/lib/jvm/java-8-openjdk-amd64/
export JAVA_HOME  = $(JDK_18_x64)

OUTDIR  := $(CURDIR)/out

# Finds the nearest stdio-X.Y tag and extracts the version numbers
VERSION := $(shell git describe --match 'studio-*' | sed 's/^studio-\([0-9\.]\+\).*/\1/p;d')

all:
	PATH="$(JAVA_HOME)/bin:$${PATH}" \
	'$(CURDIR)/../../apache-ant/bin/ant' \
		-Denable.ui.tests=0 \
		-Djdk.bundled.linux=false \
		-Dout='$(OUTDIR)' \
		-Dbuild='$(VERSION)' \
		build

install:
	mkdir -p /app
	tar --strip-components=1 -xzf '$(OUTDIR)/artifacts/android-studio-$(VERSION).tar.gz' -C /app

.PHONY: install
