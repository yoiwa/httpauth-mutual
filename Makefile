export XML_LIBRARY=xml_library
export TZ=UTC

.SECONDARY:

TARGETS=mutual-auth-protocol mutual-auth-algorithms \
	http-auth-extension
ALLTARGETS=$(TARGETS)

.PHONY: all fixate upload clean

ALLDESTS=$(foreach f,$(ALLTARGETS), $(f).txt)

all: $(ALLDESTS)

# to disable X error display by tcl/tk
XML2RFC=DISPLAY= $(HOME)/lib/xml2rfc/xml2rfc-1.35/xml2rfc.tcl

%.txt: %.xml
	$(XML2RFC) $*.xml $@

