UCC=D:/msys64/home/Marzo/exult-linux/exult/ucc.exe
UCXT=D:/msys64/home/Marzo/exult-linux/exult/ucxt.exe

all: usecode.fov2.ucxt usecode.ss2.ucxt

usecode.fov2 : usecode.fov.uc
	$(UCC) -o $@ $< |& (grep -v Warning || true)

usecode.ss2 : usecode.ss.uc
	$(UCC) -o $@ $< |& (grep -v Warning || true)

usecode.fov2.ucxt : usecode.fov2
	$(UCXT) -a -fs -fov -i$< > $@

usecode.ss2.ucxt : usecode.ss2
	$(UCXT) -a -fs -ss -i$< > $@
