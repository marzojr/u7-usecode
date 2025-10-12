UCC:=D:/msys64/home/Marzo/exult-linux/exult/ucc.exe
UCXT:=D:/msys64/home/Marzo/exult-linux/exult/ucxt.exe

UCC_ARGS:=-c always -b -W no-goto -W no-integer-coercion -W no-shape-to-function
UCXT_ARGS:=-a -fs

PASS:=\e[1m\e[32m[✔️  PASS]\e[0m
FAIL:=\e[1m\e[31m[❌  FAIL]\e[0m

strip_suffix = $(patsubst %.orig,%, $(patsubst %.new,%, $(1)))

all: usecode.fov.orig.ucxt usecode.ss.orig.ucxt check_ref

all_clean: clean
	rm -f usecode.fov.ref.ucxt usecode.ss.ref.ucxt

clean:
	rm -f usecode.fov.new.bin usecode.ss.new.bin
	rm -f usecode.fov.new.ucxt usecode.ss.new.ucxt
	rm -f usecode.fov.orig.bin usecode.ss.orig.bin
	rm -f usecode.fov.orig.ucxt usecode.ss.orig.ucxt

ref: usecode.fov.ref.ucxt usecode.ss.ref.ucxt

check_ref: usecode.fov.new.ucxt usecode.ss.new.ucxt
	@if [ ! -f usecode.fov.ref.ucxt ]; then \
		printf "$(FAIL) Reference file usecode.fov.ref.ucxt is missing!\n"; \
		exit 1; \
	fi
	@if [ ! -f usecode.ss.ref.ucxt ]; then \
		printf "$(FAIL) Reference file usecode.ss.ref.ucxt is missing!\n"; \
		exit 1; \
	fi
	@if diff -u usecode.fov.ref.ucxt usecode.fov.new.ucxt &> /dev/null; then \
		printf "$(PASS) ☥ 'Forge of Virtue' usecode matches reference.\n"; \
	else \
		printf "$(FAIL) ☥ 'Forge of Virtue' usecode differs from reference!\n"; \
		exit 1; \
	fi
	@if diff -u usecode.ss.ref.ucxt usecode.ss.new.ucxt &> /dev/null; then \
		printf "$(PASS) ⚚ 'Silver Seed' usecode matches reference.\n"; \
	else \
		printf "$(FAIL) ⚚ 'Silver Seed' usecode differs from reference!\n"; \
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
