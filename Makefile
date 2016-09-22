export JDK_16_x64 = $(CURDIR)/../../debroot/usr/lib/jvm/java-6-openjdk-amd64/
export JDK_18_x64 = /usr/lib/jvm/java-8-openjdk-amd64/
export JAVA_HOME  = $(JDK_18_x64)

OUTDIR  := $(CURDIR)/out

# Finds the nearest stdio-X.Y tag and extracts the version numbers
VERSION := $(shell git describe --match 'studio-*' | sed 's/^studio-\([0-9\.]\+\).*/\1/p;d')

all:
	PATH="$(JAVA_HOME)/bin:$${PATH}" \
	'$(CURDIR)/../../apache-ant/bin/ant' \
		-Dstudio.ui.tests='' \
		-Denable.ui.tests='' \
		-Dout='$(OUTDIR)' \
		-Dbuild='$(VERSION)' \
		build

install:
	tar --strip-components=1 -xzf '$(OUTDIR)/artifacts/android-studio-$(VERSION)-no-jdk.tar.gz' -C /app
	mkdir -p /app/share/applications
	cp com.google.AndroidStudio.desktop /app/share/applications/
	mkdir -p /app/share/icons/hicolor/128x128/apps/
	ln /app/bin/studio.png /app/share/icons/hicolor/128x128/apps/com.google.AndroidStudio.png

.PHONY: install
