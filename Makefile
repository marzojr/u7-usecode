UCC=D:/msys64/home/Marzo/exult-linux/exult/ucc.exe
UCXT=D:/msys64/home/Marzo/exult-linux/exult/ucxt.exe

FOV_SOURCES=$(wildcard fov/include/*.uc)
SS_SOURCES=$(wildcard ss/include/*.uc)

PASS=\e[1m\e[32m[✔️  PASS]\e[0m
FAIL=\e[1m\e[31m[❌  FAIL]\e[0m

all: usecode.fov3.ucxt usecode.ss3.ucxt check_ref

usecode.fov.ref.ucxt : usecode.fov2.ucxt
	cp $< $@

usecode.ss.ref.ucxt : usecode.ss2.ucxt
	cp $< $@

ref: usecode.fov.ref.ucxt usecode.ss.ref.ucxt

check_ref: usecode.fov2.ucxt usecode.ss2.ucxt
	@if [ ! -f usecode.fov.ref.ucxt ] || [ ! -f usecode.ss.ref.ucxt ]; then \
		printf "$(FAIL) Reference files usecode.fov.ref.ucxt and usecode.ss.ref.ucxt are missing!"; \
		exit 1; \
	fi
	@if diff -u usecode.fov.ref.ucxt usecode.fov2.ucxt &> /dev/null; then \
		printf "$(PASS) ☥ 'Forge of Virtue' usecode matches reference.\n"; \
	else \
		printf "$(FAIL) ☥ 'Forge of Virtue' usecode differs from reference!\n"; \
		exit 1; \
	fi
	@if diff -u usecode.ss.ref.ucxt usecode.ss2.ucxt &> /dev/null; then \
		printf "$(PASS) ⚚ 'Silver Seed' usecode matches reference.\n"; \
	else \
		printf "$(FAIL) ⚚ 'Silver Seed' usecode differs from reference!\n"; \
		exit 1; \
	fi

usecode.fov2 : fov/usecode.fov.uc $(FOV_SOURCES) $(UCC)
	rm -f usecode.fov2.ucxt usecode.fov3.ucxt
	$(UCC) -c always -b -I fov -o $@ $< |& (grep -vE "warning:.* (Interpreting integer|You \*really\*)" || true)

usecode.ss2 : ss/usecode.ss.uc $(SS_SOURCES) $(UCC)
	rm -f usecode.ss2.ucxt usecode.ss3.ucxt
	rm -f
	$(UCC) -c always -b -I ss -o $@ $< |& (grep -vE "warning:.* (Interpreting integer|You \*really\*)" || true)

usecode.fov2.ucxt : usecode.fov2 $(UCXT)
	$(UCXT) -a -fs -fov -i$< > $@ && dos2unix $@

usecode.ss2.ucxt : usecode.ss2 $(UCXT)
	$(UCXT) -a -fs -ss -i$< > $@ && dos2unix $@

usecode.fov3 : ucxt/usecode.fov.ucxt $(UCC)
	$(UCC) -u -c always -o $@ $< |& (grep -vE "warning:.* (Interpreting integer|You \*really\*)" || true)

usecode.ss3 : ucxt/usecode.ss.ucxt $(UCC)
	$(UCC) -u -c always -o $@ $< |& (grep -vE "warning:.* (Interpreting integer|You \*really\*)" || true)

usecode.fov3.ucxt : usecode.fov3 $(UCXT)
	$(UCXT) -a -fs -fov -i$< > $@ && dos2unix $@

usecode.ss3.ucxt : usecode.ss3 $(UCXT)
	$(UCXT) -a -fs -ss -i$< > $@ && dos2unix $@
