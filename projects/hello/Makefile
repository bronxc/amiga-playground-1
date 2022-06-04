all: clean build transfer

clean:
	rm -rf hello scroll

build:
	vasmm68k_mot -kick1hunks -Fhunkexe -o hello -nosym helloworld.s

transfer:
	cp hello ~/FS-UAE/Floppies/utils/helloputo
