export XML_LIBRARY=xml_library
export TZ=UTC

.SECONDARY:

TARGETS=mutual-auth-protocol mutual-auth-algorithms \
	http-auth-extension
ALLTARGETS=$(TARGETS)

.PHONY: all clean

ALLDESTS=$(foreach f,$(ALLTARGETS), $(f).txt)

all: $(ALLDESTS)

# Makefile.config must define at least XML2RFC location
include Makefile.config

XML2RFC ?= xml2rfc
# last resort definition

%.txt: %.xml
	$(XML2RFC) $*.xml $@

clean::
	rm -f $(ALLDESTS)