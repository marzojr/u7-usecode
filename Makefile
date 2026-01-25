UCC:=$(shell readlink -f $(shell command -v ucc))
UCXT:=$(shell readlink -f $(shell command -v ucxt))

UCC_ARGS:=-c always -b -W no-goto -W no-integer-coercion -W no-shape-to-function
UCXT_ARGS:=-a -fs

PASS:=\e[1m\e[32m[✔️  PASS]\e[0m
FAIL:=\e[1m\e[31m[❌  FAIL]\e[0m

strip_suffix = $(patsubst %.orig,%, $(patsubst %.new,%, $(1)))

.PHONY: all all_clean clean ref fov ss check help

all: fov ss check

help:
	@printf "make            Build fov, ss, then run all checks (default).\n"
	@printf "make fov        Build usecode.fov.new/orig bins and .new.ucxt.\n"
	@printf "make ss         Build usecode.ss.new/orig bins and .new.ucxt.\n"
	@printf "make check.fov  Diff usecode.fov.new.ucxt against usecode.fov.ref.ucxt.\n"
	@printf "make check.ss   Diff usecode.ss.new.ucxt against usecode.ss.ref.ucxt.\n"
	@printf "make check      Run check.fov and check.ss.\n"
	@printf "make ref        Refresh reference ucxts from current .new.ucxt outputs.\n"
	@printf "make clean      Remove generated bins and .ucxt (keeps refs).\n"
	@printf "make all_clean  clean + remove ref ucxts.\n"

all_clean: clean
	rm -f usecode.fov.ref.ucxt usecode.ss.ref.ucxt

clean:
	rm -f usecode.fov.new.bin usecode.ss.new.bin
	rm -f usecode.fov.new.ucxt usecode.ss.new.ucxt
	rm -f usecode.fov.orig.bin usecode.ss.orig.bin
	rm -f usecode.fov.orig.ucxt usecode.ss.orig.ucxt

fov: usecode.fov.orig.ucxt usecode.fov.new.bin usecode.fov.orig.bin usecode.fov.new.ucxt

ss: usecode.ss.orig.ucxt usecode.ss.new.bin usecode.ss.orig.bin usecode.ss.new.ucxt

ref: usecode.fov.ref.ucxt usecode.ss.ref.ucxt

check: fov ss check.fov check.ss

check.% : usecode.%.new.ucxt
	@if [ ! -f usecode.$*.ref.ucxt ]; then \
		printf "$(FAIL) Reference file usecode.$*.ref.ucxt is missing!\n"; \
		exit 1; \
	fi
	@if diff -u usecode.$*.ref.ucxt usecode.$*.new.ucxt &> /dev/null; then \
		printf "$(PASS) ☥ '$*' usecode matches reference.\n"; \
	else \
		printf "$(FAIL) ☥ '$*' usecode differs from reference!\n"; \
		exit 1; \
	fi

usecode.%.ref.ucxt : usecode.%.new.ucxt
	cp $< $@

usecode.%.new.bin : %/usecode.uc %/include/*.uc $(UCC)
	rm -f usecode.$*.new.ucxt
	$(UCC) $(UCC_ARGS) -I $* -o $@ $<

usecode.%.orig.bin : ucxt/usecode.%.ucxt $(UCC)
	rm -f usecode.$*.orig.ucxt
	$(UCC) $(UCC_ARGS) -I $* -o $@ $<

usecode.%.ucxt : usecode.%.bin $(UCXT)
	$(UCXT) $(UCXT_ARGS) -$(call strip_suffix,$*) -i$< | dos2unix > $@
