# amiga-playground

Experiments with the Commodore Amiga. This is a playground repo and always WIP 😉

[ASMPro](https://aminet.net/dev/asm/AsmPro1.18src.zip) is a native assembler for 68k, this is used in real Amiga hardware.

[vasm](http://sun.hasenbraten.de/vasm/) is a native assembler for *ix platforms and compatible with Linux.

## Directory Structure

- docs: documentation, howtos, scripts, etc.
- projects: asm projects written for ASMPro and vasm
- projects/demos: some demos,intros source code found somewhere in the net (not written by me!)
- utils: [FS-UAE](https://fs-uae.net/) Configurations for local development in an emulation environment

## Working with FS-UAE

Fast checklist:

- Get the kickstart ROMS from somewhere in the net (available for purchase in some Amiga stores) and put all the roms in the ~/FS-UAE/KickStart directory
- Copy my utils/emu/fs-uaue/configuration files to ~/FS-UAE/Configurations
- Using the top-left menu, create a Amiga hardisk (HDF) file using RDB and size 1Gb
- Use the new hardrive in the Hard Disk Configuration
- Disable Joystick cuz we'll need the keyboard cursors (by default the cursors keys are mapped as a joystick)
- Start the emulator, toggle F12 key to pause or restart the Amiga
- Install Workbench

More documentation inthe [FS-UAE](https://fs-uae.net/) site.

## Installing Workbench 3.x

TO BE DONE

## Working with ASMPro

Open a Amiga Shell and edit the User-Startup script in order to map drives 💾 at boot-startup:

```shell
ed S:User-Startup
```

Add the following command to map a drive for ASMPro (I've ASMPro in System:/Tools/ASMPro):

```shell
ASSIGN ASMPro: "System:Tools/ASMPro"
```

Optionally add the following command to map a drive for [BareMetal](https://www.edsa.uk/blog/bare-metal-amiga-programming) examples:

```shell
ASSIGN BareMetal: "Work:Dev/BareMetal"
```

NOTE: Change your path to your own volume. I'm using "Work" which is DH1.

Save to disk, exit the editor and then reboot the Amiga.

Execute ASMPro and start to write code or open some files.

- Use `r` for open a file
- Use `a` for assemble the current project
- Use `wo` for assmble the current project to a file
- Use `Function Keys` for switch project
- Use `j` to jump to a address
- Use `!!` for exit the program

## Working with vasm

In a Linux enviroment, compile source code with vasm:

```shell
vasmm68k_mot -kick1hunks -Fhunkexe -o hello -nosym helloworld.s
```

## Author

2022 - Iban Nieto (this repo)
