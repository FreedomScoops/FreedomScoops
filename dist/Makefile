ASCIIDOC_MAN=a2x -f manpage
.SUFFIXES: .adoc .6

all: FS-Arena.6 FS-First-Crunch.6 FS-Second-Crunch.6 FSA.png \
     FSFC1.png FSSC1.png

%.6: FreedomScoops.adoc
	sed -e s/FS/$*/ $< > $*.adoc
	$(ASCIIDOC_MAN) $*.adoc

FSA.png: ../graphics/screens/freedm_title2.png
	./pillow-resize $< $@ 64 64

FSFC1.png: ../sprites/playa2a8.png
	./pillow-compose $< $@ 64 64

FSSC1.png: ../sprites/heada1.png
	./pillow-compose $< $@ 64 64

clean:
	$(RM) *.6 *.png FS-Arena.adoc FS-First-Crunch.adoc FS-Second-Crunch.adoc
