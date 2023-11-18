UCC=D:/msys64/home/Marzo/exult-linux/exult/ucc.exe
UCXT=D:/msys64/home/Marzo/exult-linux/exult/ucxt.exe

FOV_SOURCES=$(wildcard fov/include/*.uc)
SS_SOURCES=$(wildcard ss/include/*.uc)

all: usecode.fov2.ucxt usecode.ss2.ucxt usecode.fov3.ucxt usecode.ss3.ucxt

usecode.fov2 : fov/usecode.fov.uc $(FOV_SOURCES) $(UCC)
	$(UCC) -I fov -o $@ $< |& (grep -vE "Warning: (Interpreting integer|You \*really\*)" || true)

usecode.ss2 : ss/usecode.ss.uc $(SS_SOURCES) $(UCC)
	$(UCC) -I ss -o $@ $< |& (grep -vE "Warning: (Interpreting integer|You \*really\*)" || true)

usecode.fov2.ucxt : usecode.fov2 $(UCXT)
	$(UCXT) -a -fs -fov -i$< > $@

usecode.ss2.ucxt : usecode.ss2 $(UCXT)
	$(UCXT) -a -fs -ss -i$< > $@

usecode.fov3 : ucxt/usecode.fov.ucxt $(UCC)
	$(UCC) -o $@ $< |& (grep -vE "Warning: (Interpreting integer|You \*really\*)" || true)

usecode.ss3 : ucxt/usecode.ss.ucxt $(UCC)
	$(UCC) -o $@ $< |& (grep -vE "Warning: (Interpreting integer|You \*really\*)" || true)

usecode.fov3.ucxt : usecode.fov3 $(UCXT)
	$(UCXT) -a -fs -fov -i$< > $@

usecode.ss3.ucxt : usecode.ss3 $(UCXT)
	$(UCXT) -a -fs -ss -i$< > $@
