SRCS =\
	src/alarm.c\
	src/attach.c\
	src/autostart-prg.c\
	src/autostart.c\
	src/cbmdos.c\
	src/cbmimage.c\
	src/charset.c\
	src/clipboard.c\
	src/clkguard.c\
	src/cmdline.c\
	src/color.c\
	src/crc32.c\
	src/datasette.c\
	src/debug.c\
	src/dma.c\
	src/embedded.c\
	src/event.c\
	src/findpath.c\
	src/fliplist.c\
	src/gcr.c\
	src/info.c\
	src/init.c\
	src/initcmdline.c\
	src/interrupt.c\
	src/ioutil.c\
	src/kbdbuf.c\
	src/keyboard.c\
	src/lib.c\
	src/libm_math.c\
	src/log.c\
	src/machine-bus.c\
	src/machine.c\
	src/main.c\
	src/midi.c\
	src/network.c\
	src/opencbmlib.c\
	src/palette.c\
	src/ram.c\
	src/rawfile.c\
	src/rawnet.c\
	src/resources.c\
	src/romset.c\
	src/screenshot.c\
	src/snapshot.c\
	src/socket.c\
	src/sound.c\
	src/sysfile.c\
	src/traps.c\
	src/util.c\
	src/vicefeatures.c\
	src/vsync.c\
	src/zfile.c\
	src/zipcode.c\
	src/arch/sdl/archdep.c\
	src/arch/sdl/blockdev.c\
	src/arch/sdl/console.c\
	src/arch/sdl/coproc.c\
	src/arch/sdl/dynlib.c\
	src/arch/sdl/fullscreen.c\
	src/arch/sdl/icon.c\
	src/arch/sdl/joy.c\
	src/arch/sdl/kbd.c\
	src/arch/sdl/lightpendrv.c\
	src/arch/sdl/menu_c128hw.c\
	src/arch/sdl/menu_c64_common_expansions.c\
	src/arch/sdl/menu_c64_expansions.c\
	src/arch/sdl/menu_c64cart.c\
	src/arch/sdl/menu_c64dtvhw.c\
	src/arch/sdl/menu_c64hw.c\
	src/arch/sdl/menu_c64model.c\
	src/arch/sdl/menu_cbm2cart.c\
	src/arch/sdl/menu_cbm2hw.c\
	src/arch/sdl/menu_common.c\
	src/arch/sdl/menu_debug.c\
	src/arch/sdl/menu_drive.c\
	src/arch/sdl/menu_drive_rom.c\
	src/arch/sdl/menu_edit.c\
	src/arch/sdl/menu_ethernet.c\
	src/arch/sdl/menu_ethernetcart.c\
	src/arch/sdl/menu_jam.c\
	src/arch/sdl/menu_joyport.c\
	src/arch/sdl/menu_joystick.c\
	src/arch/sdl/menu_midi.c\
	src/arch/sdl/menu_mouse.c\
	src/arch/sdl/menu_petcart.c\
	src/arch/sdl/menu_pethw.c\
	src/arch/sdl/menu_plus4cart.c\
	src/arch/sdl/menu_plus4hw.c\
	src/arch/sdl/menu_ram.c\
	src/arch/sdl/menu_reset.c\
	src/arch/sdl/menu_rom.c\
	src/arch/sdl/menu_rs232.c\
	src/arch/sdl/menu_scpu64hw.c\
	src/arch/sdl/menu_settings.c\
	src/arch/sdl/menu_sid.c\
	src/arch/sdl/menu_snapshot.c\
	src/arch/sdl/menu_sound.c\
	src/arch/sdl/menu_speed.c\
	src/arch/sdl/menu_tape.c\
	src/arch/sdl/menu_vic20cart.c\
	src/arch/sdl/menu_vic20hw.c\
	src/arch/sdl/menu_video.c\
	src/arch/sdl/mousedrv.c\
	src/arch/sdl/rawnetarch.c\
	src/arch/sdl/rs232dev.c\
	src/arch/sdl/sdlmain.c\
	src/arch/sdl/signals.c\
	src/arch/sdl/ui.c\
	src/arch/sdl/uifilereq.c\
	src/arch/sdl/uifonts.c\
	src/arch/sdl/uifontscbm2.c\
	src/arch/sdl/uifontscrtc.c\
	src/arch/sdl/uifontsted.c\
	src/arch/sdl/uifontsvic.c\
	src/arch/sdl/uifontsvicii.c\
	src/arch/sdl/uihotkey.c\
	src/arch/sdl/uiimagefilereq.c\
	src/arch/sdl/uimenu.c\
	src/arch/sdl/uimon.c\
	src/arch/sdl/uimsgbox.c\
	src/arch/sdl/uipause.c\
	src/arch/sdl/uipoll.c\
	src/arch/sdl/uistatusbar.c\
	src/arch/sdl/video_sdl1.c\
	src/arch/sdl/vkbd.c\
	src/arch/sdl/vsyncarch.c\
	src/arch/sdl/x64_ui.c\
	src/arch/shared/archdep_atexit.c\
	src/arch/shared/archdep_boot_path.c\
	src/arch/shared/archdep_cbmfont.c\
	src/arch/shared/archdep_create_user_config_dir.c\
	src/arch/shared/archdep_default_autostart_disk_image_file_name.c\
	src/arch/shared/archdep_default_fliplist_file_name.c\
	src/arch/shared/archdep_default_resource_file_name.c\
	src/arch/shared/archdep_default_rtc_file_name.c\
	src/arch/shared/archdep_default_sysfile_pathlist.c\
	src/arch/shared/archdep_expand_path.c\
	src/arch/shared/archdep_extra_title_text.c\
	src/arch/shared/archdep_file_is_blockdev.c\
	src/arch/shared/archdep_file_is_chardev.c\
	src/arch/shared/archdep_filename_parameter.c\
	src/arch/shared/archdep_fix_permissions.c\
	src/arch/shared/archdep_get_vice_datadir.c\
	src/arch/shared/archdep_get_vice_docsdir.c\
	src/arch/shared/archdep_home_path.c\
	src/arch/shared/archdep_join_paths.c\
	src/arch/shared/archdep_make_backup_filename.c\
	src/arch/shared/archdep_mkdir.c\
	src/arch/shared/archdep_open_default_log_file.c\
	src/arch/shared/archdep_path_is_relative.c\
	src/arch/shared/archdep_program_name.c\
	src/arch/shared/archdep_program_path.c\
	src/arch/shared/archdep_quote_parameter.c\
	src/arch/shared/archdep_rename.c\
	src/arch/shared/archdep_rmdir.c\
	src/arch/shared/archdep_sanitize_filename.c\
	src/arch/shared/archdep_startup_log_error.c\
	src/arch/shared/archdep_stat.c\
	src/arch/shared/archdep_tmpnam.c\
	src/arch/shared/archdep_user_config_path.c\
	src/arch/shared/archdep_xdg.c\
	src/arch/shared/archdep_xdg.c\
	src/c64/c64-cmdline-options.c\
	src/c64/c64-memory-hacks.c\
	src/c64/c64-resources.c\
	src/c64/c64-snapshot.c\
	src/c64/c64.c\
	src/c64/c64_256k.c\
	src/c64/c64bus.c\
	src/c64/c64cia1.c\
	src/c64/c64cia2.c\
	src/c64/c64cpu.c\
	src/c64/c64datasette.c\
	src/c64/c64drive.c\
	src/c64/c64embedded.c\
	src/c64/c64export.c\
	src/c64/c64fastiec.c\
	src/c64/c64gluelogic.c\
	src/c64/c64iec.c\
	src/c64/c64io.c\
	src/c64/c64keyboard.c\
	src/c64/c64mem.c\
	src/c64/c64meminit.c\
	src/c64/c64memlimit.c\
	src/c64/c64memrom.c\
	src/c64/c64memsnapshot.c\
	src/c64/c64model.c\
	src/c64/c64parallel.c\
	src/c64/c64pla.c\
	src/c64/c64rom.c\
	src/c64/c64romset.c\
	src/c64/c64rsuser.c\
	src/c64/c64sound.c\
	src/c64/c64video.c\
	src/c64/cart/actionreplay.c\
	src/c64/cart/actionreplay2.c\
	src/c64/cart/actionreplay3.c\
	src/c64/cart/actionreplay4.c\
	src/c64/cart/atomicpower.c\
	src/c64/cart/c64-generic.c\
	src/c64/cart/c64-midi.c\
	src/c64/cart/c64acia1.c\
	src/c64/cart/c64cart.c\
	src/c64/cart/c64carthooks.c\
	src/c64/cart/c64cartmem.c\
	src/c64/cart/c64tpi.c\
	src/c64/cart/capture.c\
	src/c64/cart/clockport-mp3at64.c\
	src/c64/cart/clockport-rrnet.c\
	src/c64/cart/clockport.c\
	src/c64/cart/comal80.c\
	src/c64/cart/cpmcart.c\
	src/c64/cart/crt.c\
	src/c64/cart/cs8900io.c\
	src/c64/cart/daa.c\
	src/c64/cart/debugcart.c\
	src/c64/cart/delaep256.c\
	src/c64/cart/delaep64.c\
	src/c64/cart/delaep7x8.c\
	src/c64/cart/diashowmaker.c\
	src/c64/cart/digimax.c\
	src/c64/cart/dinamic.c\
	src/c64/cart/dqbb.c\
	src/c64/cart/ds12c887rtc.c\
	src/c64/cart/easycalc.c\
	src/c64/cart/easyflash.c\
	src/c64/cart/epyxfastload.c\
	src/c64/cart/ethernetcart.c\
	src/c64/cart/exos.c\
	src/c64/cart/expert.c\
	src/c64/cart/final.c\
	src/c64/cart/final3.c\
	src/c64/cart/finalplus.c\
	src/c64/cart/formel64.c\
	src/c64/cart/freezeframe.c\
	src/c64/cart/freezemachine.c\
	src/c64/cart/funplay.c\
	src/c64/cart/gamekiller.c\
	src/c64/cart/georam.c\
	src/c64/cart/gmod2.c\
	src/c64/cart/gs.c\
	src/c64/cart/ide64.c\
	src/c64/cart/isepic.c\
	src/c64/cart/kcs.c\
	src/c64/cart/kingsoft.c\
	src/c64/cart/mach5.c\
	src/c64/cart/magicdesk.c\
	src/c64/cart/magicformel.c\
	src/c64/cart/magicvoice.c\
	src/c64/cart/mikroass.c\
	src/c64/cart/mmc64.c\
	src/c64/cart/mmcreplay.c\
	src/c64/cart/ocean.c\
	src/c64/cart/pagefox.c\
	src/c64/cart/prophet64.c\
	src/c64/cart/ramcart.c\
	src/c64/cart/retroreplay.c\
	src/c64/cart/reu.c\
	src/c64/cart/rexep256.c\
	src/c64/cart/rexutility.c\
	src/c64/cart/rgcd.c\
	src/c64/cart/ross.c\
	src/c64/cart/rrnetmk3.c\
	src/c64/cart/sfx_soundexpander.c\
	src/c64/cart/sfx_soundsampler.c\
	src/c64/cart/shortbus.c\
	src/c64/cart/shortbus_digimax.c\
	src/c64/cart/shortbus_etfe.c\
	src/c64/cart/silverrock128.c\
	src/c64/cart/simonsbasic.c\
	src/c64/cart/snapshot64.c\
	src/c64/cart/stardos.c\
	src/c64/cart/stb.c\
	src/c64/cart/superexplode5.c\
	src/c64/cart/supergames.c\
	src/c64/cart/supersnapshot.c\
	src/c64/cart/supersnapshot4.c\
	src/c64/cart/warpspeed.c\
	src/c64/cart/westermann.c\
	src/c64/cart/zaxxon.c\
	src/c64/patchrom.c\
	src/c64/plus256k.c\
	src/c64/plus60k.c\
	src/core/ata.c\
	src/core/ciacore.c\
	src/core/ciatimer.c\
	src/core/cs8900.c\
	src/core/flash040core.c\
	src/core/fmopl.c\
	src/core/m93c86.c\
	src/core/mc6821core.c\
	src/core/riotcore.c\
	src/core/ser-eeprom.c\
	src/core/spi-sdcard.c\
	src/core/t6721.c\
	src/core/tpicore.c\
	src/core/viacore.c\
	src/diag/c64_diag_586220_harness.c\
	src/diskimage/diskimage.c\
	src/diskimage/fsimage-check.c\
	src/diskimage/fsimage-create.c\
	src/diskimage/fsimage-dxx.c\
	src/diskimage/fsimage-gcr.c\
	src/diskimage/fsimage-p64.c\
	src/diskimage/fsimage-probe.c\
	src/diskimage/fsimage.c\
	src/diskimage/rawimage.c\
	src/drive/drive-check.c\
	src/drive/drive-cmdline-options.c\
	src/drive/drive-overflow.c\
	src/drive/drive-resources.c\
	src/drive/drive-snapshot.c\
	src/drive/drive-sound.c\
	src/drive/drive-writeprotect.c\
	src/drive/drive.c\
	src/drive/drivecpu.c\
	src/drive/drivecpu65c02.c\
	src/drive/driveimage.c\
	src/drive/drivemem.c\
	src/drive/driverom.c\
	src/drive/drivesync.c\
	src/drive/iec/c64exp/c64exp-cmdline-options.c\
	src/drive/iec/c64exp/c64exp-resources.c\
	src/drive/iec/c64exp/dolphindos3.c\
	src/drive/iec/c64exp/iec-c64exp.c\
	src/drive/iec/c64exp/profdos.c\
	src/drive/iec/c64exp/stardos-exp.c\
	src/drive/iec/c64exp/supercard.c\
	src/drive/iec/cia1571d.c\
	src/drive/iec/cia1581d.c\
	src/drive/iec/fdd.c\
	src/drive/iec/glue1571.c\
	src/drive/iec/iec-cmdline-options.c\
	src/drive/iec/iec-resources.c\
	src/drive/iec/iec.c\
	src/drive/iec/iecrom.c\
	src/drive/iec/memiec.c\
	src/drive/iec/pc8477.c\
	src/drive/iec/via1d1541.c\
	src/drive/iec/via4000.c\
	src/drive/iec/wd1770.c\
	src/drive/iecieee/iecieee.c\
	src/drive/iecieee/via2d.c\
	src/drive/ieee/fdc.c\
	src/drive/ieee/ieee-cmdline-options.c\
	src/drive/ieee/ieee-resources.c\
	src/drive/ieee/ieee.c\
	src/drive/ieee/ieeerom.c\
	src/drive/ieee/memieee.c\
	src/drive/ieee/riot1d.c\
	src/drive/ieee/riot2d.c\
	src/drive/ieee/via1d2031.c\
	src/drive/rotation.c\
	src/drive/tcbm/glue1551.c\
	src/drive/tcbm/mem1551.c\
	src/drive/tcbm/tcbm-cmdline-options.c\
	src/drive/tcbm/tcbm-resources.c\
	src/drive/tcbm/tcbm.c\
	src/drive/tcbm/tcbmrom.c\
	src/drive/tcbm/tpid.c\
	src/fileio/cbmfile.c\
	src/fileio/fileio.c\
	src/fileio/p00.c\
	src/fsdevice/fsdevice-close.c\
	src/fsdevice/fsdevice-cmdline-options.c\
	src/fsdevice/fsdevice-flush.c\
	src/fsdevice/fsdevice-open.c\
	src/fsdevice/fsdevice-read.c\
	src/fsdevice/fsdevice-resources.c\
	src/fsdevice/fsdevice-write.c\
	src/fsdevice/fsdevice.c\
	src/gfxoutputdrv/bmpdrv.c\
	src/gfxoutputdrv/doodledrv.c\
	src/gfxoutputdrv/gfxoutput.c\
	src/gfxoutputdrv/godotdrv.c\
	src/gfxoutputdrv/iffdrv.c\
	src/gfxoutputdrv/koaladrv.c\
	src/gfxoutputdrv/nativedrv.c\
	src/gfxoutputdrv/pcxdrv.c\
	src/gfxoutputdrv/ppmdrv.c\
	src/hvsc/base.c\
	src/hvsc/bugs.c\
	src/hvsc/main.c\
	src/hvsc/psid.c\
	src/hvsc/sldb.c\
	src/hvsc/stil.c\
	src/hwsiddrv/catweaselmkiii-amiga-drv.c\
	src/hwsiddrv/catweaselmkiii-beos-drv.c\
	src/hwsiddrv/catweaselmkiii-unix-drv.c\
	src/hwsiddrv/catweaselmkiii-win32-drv.c\
	src/hwsiddrv/cw-amiga-clockport.c\
	src/hwsiddrv/cw-amiga-device.c\
	src/hwsiddrv/cw-amiga-openpci.c\
	src/hwsiddrv/cw-amiga-os4.c\
	src/hwsiddrv/cw-amiga-zorro.c\
	src/hwsiddrv/cw-unix-device.c\
	src/hwsiddrv/cw-unix-pci.c\
	src/hwsiddrv/cw-win32-dll.c\
	src/hwsiddrv/cw-win32-pci.c\
	src/hwsiddrv/hardsid-amiga-drv.c\
	src/hwsiddrv/hardsid-beos-drv.c\
	src/hwsiddrv/hardsid-unix-drv.c\
	src/hwsiddrv/hardsid-win32-drv.c\
	src/hwsiddrv/hs-amiga-gg2isa.c\
	src/hwsiddrv/hs-amiga-openpci.c\
	src/hwsiddrv/hs-amiga-os4.c\
	src/hwsiddrv/hs-beos-isa.c\
	src/hwsiddrv/hs-beos-pci.c\
	src/hwsiddrv/hs-unix-isa.c\
	src/hwsiddrv/hs-unix-linux.c\
	src/hwsiddrv/hs-unix-pci.c\
	src/hwsiddrv/hs-win32-dll.c\
	src/hwsiddrv/hs-win32-isa.c\
	src/hwsiddrv/hs-win32-pci.c\
	src/hwsiddrv/parsid-beos-drv.c\
	src/hwsiddrv/parsid-unix-drv.c\
	src/hwsiddrv/parsid-win32-drv.c\
	src/hwsiddrv/ps-ieee1284.c\
	src/hwsiddrv/ps-unix-file.c\
	src/hwsiddrv/ps-unix-io.c\
	src/hwsiddrv/ps-win32-dll.c\
	src/hwsiddrv/ps-win32-io.c\
	src/hwsiddrv/ssi2001-amiga-drv.c\
	src/hwsiddrv/ssi2001-beos-drv.c\
	src/hwsiddrv/ssi2001-unix-drv.c\
	src/hwsiddrv/ssi2001-win32-drv.c\
	src/iecbus/iecbus.c\
	src/imagecontents/diskcontents-block.c\
	src/imagecontents/diskcontents-iec.c\
	src/imagecontents/diskcontents.c\
	src/imagecontents/imagecontents.c\
	src/imagecontents/tapecontents.c\
	src/iodrv/io-beos-access.c\
	src/iodrv/io-unix-access.c\
	src/iodrv/pci-beos-drv.c\
	src/iodrv/pci-unix-drv.c\
	src/joyport/bbrtc.c\
	src/joyport/cardkey.c\
	src/joyport/coplin_keypad.c\
	src/joyport/cx21.c\
	src/joyport/cx85.c\
	src/joyport/joyport.c\
	src/joyport/joystick.c\
	src/joyport/lightpen.c\
	src/joyport/mouse.c\
	src/joyport/paperclip64.c\
	src/joyport/rushware_keypad.c\
	src/joyport/sampler2bit.c\
	src/joyport/sampler4bit.c\
	src/joyport/script64_dongle.c\
	src/joyport/snespad.c\
	src/joyport/vizawrite64_dongle.c\
	src/joyport/waasoft_dongle.c\
	src/lib/p64/p64.c\
	src/mididrv/midi-osx-drv.c\
	src/mididrv/midi-unix-drv.c\
	src/mididrv/midi-win32-drv.c\
	src/monitor/asm6502.c\
	src/monitor/asm6502dtv.c\
	src/monitor/asm65816.c\
	src/monitor/asm6809.c\
	src/monitor/asmR65C02.c\
	src/monitor/asmz80.c\
	src/monitor/mon_assemble6502.c\
	src/monitor/mon_assemble65816.c\
	src/monitor/mon_assemble6809.c\
	src/monitor/mon_assembleR65C02.c\
	src/monitor/mon_assemblez80.c\
	src/monitor/mon_breakpoint.c\
	src/monitor/mon_command.c\
	src/monitor/mon_disassemble.c\
	src/monitor/mon_drive.c\
	src/monitor/mon_file.c\
	src/monitor/mon_lex.c\
	src/monitor/mon_memmap.c\
	src/monitor/mon_memory.c\
	src/monitor/mon_parse.c\
	src/monitor/mon_register.c\
	src/monitor/mon_register6502.c\
	src/monitor/mon_register6502dtv.c\
	src/monitor/mon_register65816.c\
	src/monitor/mon_register6809.c\
	src/monitor/mon_registerR65C02.c\
	src/monitor/mon_registerz80.c\
	src/monitor/mon_ui.c\
	src/monitor/mon_util.c\
	src/monitor/monitor.c\
	src/monitor/monitor_network.c\
	src/parallel/parallel-trap.c\
	src/parallel/parallel.c\
	src/raster/raster-cache.c\
	src/raster/raster-canvas.c\
	src/raster/raster-changes.c\
	src/raster/raster-cmdline-options.c\
	src/raster/raster-line-changes-sprite.c\
	src/raster/raster-line-changes.c\
	src/raster/raster-line.c\
	src/raster/raster-modes.c\
	src/raster/raster-resources.c\
	src/raster/raster-sprite-cache.c\
	src/raster/raster-sprite-status.c\
	src/raster/raster-sprite.c\
	src/raster/raster.c\
	src/rs232drv/rs232.c\
	src/rs232drv/rs232drv.c\
	src/rs232drv/rs232net.c\
	src/rs232drv/rsuser.c\
	src/rtc/bq4830y.c\
	src/rtc/ds1202_1302.c\
	src/rtc/ds1216e.c\
	src/rtc/ds12c887.c\
	src/rtc/ds1307.c\
	src/rtc/ds1602.c\
	src/rtc/pcf8583.c\
	src/rtc/rtc-58321a.c\
	src/rtc/rtc-72421.c\
	src/rtc/rtc.c\
	src/samplerdrv/file_drv.c\
	src/samplerdrv/portaudio_drv.c\
	src/samplerdrv/sampler.c\
	src/serial/fsdrive.c\
	src/serial/serial-device.c\
	src/serial/serial-iec-bus.c\
	src/serial/serial-iec-device.c\
	src/serial/serial-iec-lib.c\
	src/serial/serial-iec.c\
	src/serial/serial-realdevice.c\
	src/serial/serial-trap.c\
	src/serial/serial.c\
	src/sid/catweaselmkiii.c\
	src/sid/fastsid.c\
	src/sid/hardsid.c\
	src/sid/parsid.c\
	src/sid/sid-cmdline-options.c\
	src/sid/sid-resources.c\
	src/sid/sid-snapshot.c\
	src/sid/sid.c\
	src/sid/ssi2001.c\
	src/socketdrv/socketdrv.c\
	src/sounddrv/soundaiff.c\
	src/sounddrv/sounddummy.c\
	src/sounddrv/sounddump.c\
	src/sounddrv/soundfs.c\
	src/sounddrv/soundiff.c\
	src/sounddrv/soundmovie.c\
	src/sounddrv/soundndsp.c\
	src/sounddrv/soundsdl.c\
	src/sounddrv/soundvoc.c\
	src/sounddrv/soundwav.c\
	src/tape/t64.c\
	src/tape/tap.c\
	src/tape/tape-internal.c\
	src/tape/tape-snapshot.c\
	src/tape/tape.c\
	src/tape/tapeimage.c\
	src/tapeport/cp-clockf83.c\
	src/tapeport/dtl-basic-dongle.c\
	src/tapeport/sense-dongle.c\
	src/tapeport/tape_diag_586220_harness.c\
	src/tapeport/tapecart.c\
	src/tapeport/tapelog.c\
	src/tapeport/tapeport.c\
	src/userport/userport.c\
	src/userport/userport_4bit_sampler.c\
	src/userport/userport_8bss.c\
	src/userport/userport_dac.c\
	src/userport/userport_diag_586220_harness.c\
	src/userport/userport_digimax.c\
	src/userport/userport_joystick.c\
	src/userport/userport_rtc_58321a.c\
	src/userport/userport_rtc_ds1307.c\
	src/vdrive/vdrive-bam.c\
	src/vdrive/vdrive-command.c\
	src/vdrive/vdrive-dir.c\
	src/vdrive/vdrive-iec.c\
	src/vdrive/vdrive-internal.c\
	src/vdrive/vdrive-rel.c\
	src/vdrive/vdrive-snapshot.c\
	src/vdrive/vdrive.c\
	src/vicii/vicii-badline.c\
	src/vicii/vicii-clock-stretch.c\
	src/vicii/vicii-cmdline-options.c\
	src/vicii/vicii-color.c\
	src/vicii/vicii-draw.c\
	src/vicii/vicii-fetch.c\
	src/vicii/vicii-irq.c\
	src/vicii/vicii-mem.c\
	src/vicii/vicii-phi1.c\
	src/vicii/vicii-resources.c\
	src/vicii/vicii-snapshot.c\
	src/vicii/vicii-sprites.c\
	src/vicii/vicii-stubs.c\
	src/vicii/vicii-timing.c\
	src/vicii/vicii.c\
	src/video/render1x1.c\
	src/video/render1x1crt.c\
	src/video/render1x1ntsc.c\
	src/video/render1x1pal.c\
	src/video/render1x2.c\
	src/video/render1x2crt.c\
	src/video/render2x2.c\
	src/video/render2x2crt.c\
	src/video/render2x2ntsc.c\
	src/video/render2x2pal.c\
	src/video/render2x4.c\
	src/video/render2x4crt.c\
	src/video/renderscale2x.c\
	src/video/renderyuv.c\
	src/video/video-canvas.c\
	src/video/video-cmdline-options.c\
	src/video/video-color.c\
	src/video/video-render-1x2.c\
	src/video/video-render-2x2.c\
	src/video/video-render-crt.c\
	src/video/video-render-pal.c\
	src/video/video-render.c\
	src/video/video-resources.c\
	src/video/video-sound.c\
	src/video/video-viewport.c

INCLUDES =\
	-I/opt/devkitpro/portlibs/3ds/include\
	-I/opt/devkitpro/libctru/include\
	-Isrc\
	-Isrc/arch/sdl\
	-Isrc/arch/shared\
	-Isrc/c64\
	-Isrc/c64dtv\
	-Isrc/c64/cart\
	-Isrc/c128\
	-Isrc/pet\
	-Isrc/cbm2\
	-Isrc/core\
	-Isrc/diag\
	-Isrc/diskimage\
	-Isrc/drive\
	-Isrc/drive/iec\
	-Isrc/drive/iec/c64exp\
	-Isrc/drive/iecieee\
	-Isrc/drive/ieee\
	-Isrc/drive/tcbm\
	-Isrc/fileio\
	-Isrc/fsdevice\
	-Isrc/gfxoutputdrv\
	-Isrc/hvsc\
	-Isrc/hwsiddrv\
	-Isrc/iecbus\
	-Isrc/imagecontents\
	-Isrc/iodrv\
	-Isrc/joyport\
	-Isrc/lib/p64\
	-Isrc/mididrv\
	-Isrc/monitor\
	-Isrc/parallel\
	-Isrc/plus4\
	-Isrc/raster\
	-Isrc/rs232drv\
	-Isrc/rtc\
	-Isrc/samplerdrv\
	-Isrc/serial\
	-Isrc/sid\
	-Isrc/socketdrv\
	-Isrc/sounddrv\
	-Isrc/tape\
	-Isrc/tapeport\
	-Isrc/userport\
	-Isrc/vdrive\
	-Isrc/vicii\
	-Isrc/vic20\
	-Isrc/video

LDFLAGS =\
	-L/opt/devkitpro/portlibs/3ds/lib\
	-L/opt/devkitpro/portlibs/3ds\
	-L/opt/devkitpro/libctru/lib\
	-lctru\
	-lSDL\
	-lcitro3d\
	-lctru\
	-lm\
	-lSDLmain\
	-lSDL

# DEBUG DEFINES
# DEFINES = -DSDL_DEBUG -DDEBUG -DARCHDEP_EXTRA_LOG_CALL

CFLAGS = -DARM11 -D_3DS -D_GNU_SOURCE=1 -O2 -Werror=implicit-function-declaration -Wfatal-errors -Wl,-rpath -Wl,/usr/lib/vice/lib -Wmissing-prototypes -Wshadow -fdata-sections -ffunction-sections -march=armv6k -mfloat-abi=hard -mtp=soft -mtune=mpcore -mword-relocations -specs=3dsx.specs $(DEFINES) $(INCLUDES)

CC = arm-none-eabi-gcc
ODIR = obj
BDIR = build
RDIR = resources
NAME = vice3ds

OBJ = $(addsuffix .o,$(addprefix $(ODIR)/,$(subst /,.,$(basename $(SRCS)))))
$(shell mkdir -p $(ODIR) >/dev/null)
$(shell mkdir -p $(BDIR) >/dev/null)
DEPFLAGS = -MT $@ -MMD -MP -MF $(ODIR)/$*.Td
POSTCOMPILE = @mv -f $(ODIR)/$*.Td $(ODIR)/$*.d && touch $@

$(BDIR)/$(NAME).3dsx: $(ODIR)/$(NAME).elf $(RDIR)/icon.png
	smdhtool --create "Vice3DS" "Vice C64 emulator for Nintendo 3DS" "badda71" $(RDIR)/icon.png $(ODIR)/$(NAME).smdh
	3dsxtool $(ODIR)/$(NAME).elf $(BDIR)/$(NAME).3dsx --romfs=romfs --smdh=$(ODIR)/$(NAME).smdh

$(ODIR)/$(NAME).elf: $(OBJ)
	$(CC) $(CFLAGS) -o $@ -Wl,--start-group $(ODIR)/*.o $(LDFLAGS) -Wl,--end-group

$(ODIR)/%.d: ;
.PRECIOUS: $(ODIR)/%.d

.SECONDEXPANSION:
$(ODIR)/%.o: $$(subst .,/,$$*).c $(ODIR)/%.d
	$(CC) $(CFLAGS) $(DEPFLAGS) -g -c -o $@ $<
	$(POSTCOMPILE)

include $(wildcard $(patsubst %,%.d,$(basename $(OBJ))))

.PHONY: clean
clean:
	rm -rf $(ODIR)
	rm -rf $(BDIR)
