/*
 * kbd.c - SDL keyboard driver.
 *
 * Written by
 *  Hannu Nuotio <hannu.nuotio@tut.fi>
 *  Marco van den Heuvel <blackystardust68@yahoo.com>
 *
 * Based on code by
 *  Ettore Perazzoli <ettore@comm2000.it>
 *  Andreas Boose <viceteam@t-online.de>
 *
 * This file is part of VICE, the Versatile Commodore Emulator.
 * See README for copyright notice.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
 *  02111-1307  USA.
 *
 */

#include "vice.h"
#include "types.h"

#include "vice_sdl.h"
#include <stdio.h>
#include <string.h>

#include "archdep.h"
#include "cmdline.h"
#include "kbd.h"
#include "fullscreenarch.h"
#include "keyboard.h"
#include "lib.h"
#include "log.h"
#include "machine.h"
#include "monitor.h"
#include "resources.h"
#include "sysfile.h"
#include "ui.h"
#include "uihotkey.h"
#include "uimenu.h"
#include "util.h"
//#include "vkbd.h"
#include "uibottom.h"
#include "autofire.h"
#include "joystick.h"
#include "vice3ds.h"

/* #define SDL_DEBUG */

static log_t sdlkbd_log = LOG_ERR;

/* Hotkey filename */
char *hotkeys_buffer = NULL;

/* Menu keys */
int sdl_ui_menukeys[MENU_ACTION_NUM];

/* UI hotkeys: index is the key(combo), value is a pointer to the menu item.
   4 is the number of the supported modifiers: shift, alt, control, meta. */
ui_menu_entry_t *sdlkbd_ui_hotkeys[SDLKBD_UI_HOTKEYS_MAX] = {NULL};

/* ------------------------------------------------------------------------ */

/* Resources.  */
/*
static int hotkey_file_set(const char *val, void *param)
{
#ifdef SDL_DEBUG
    log_debug("%s: %s\n", __func__, val);
#endif

    if (util_string_set(&hotkey_file, val)) {
        return 0;
    }

    return sdlkbd_hotkeys_load(hotkey_file);
}
*/
static resource_string_t resources_string[] = {
/*
	{ "HotkeyFile", NULL, RES_EVENT_NO, NULL,
      &hotkey_file, hotkey_file_set, (void *)0 },
*/
	{ "KeyMappings", "", RES_EVENT_NO, NULL,
      &keymap3ds_resource, keymap3ds_resource_set, NULL },
    RESOURCE_STRING_LIST_END
};

int sdlkbd_init_resources(void)
{
    if (resources_register_string(resources_string) < 0) {
        return -1;
    }
    return 0;
}

void sdlkbd_resources_shutdown(void)
{
    free(hotkeys_buffer);
    hotkeys_buffer = NULL;
}

/* ------------------------------------------------------------------------ */

static const cmdline_option_t cmdline_options[] =
{
    { "-hotkeyfile", SET_RESOURCE, CMDLINE_ATTRIB_NEED_ARGS,
      NULL, NULL, "HotkeyFile", NULL,
      "<name>", "Specify name of hotkey file" },
    CMDLINE_LIST_END
};

int sdlkbd_init_cmdline(void)
{
    return cmdline_register_options(cmdline_options);
}

/* ------------------------------------------------------------------------ */

/* Convert 'known' keycodes to SDL1x keycodes.
   Unicode keycodes and 'unknown' keycodes are
   translated to 'SDLK_UNKNOWN'.

   This makes SDL2 key handling compatible with
   SDL1 key handling, but a proper solution for
   handling unicode will still need to be made.
 */
#ifdef USE_SDLUI2
typedef struct SDL2Key_s {
    SDLKey SDL1x;
    SDLKey SDL2x;
} SDL2Key_t;

static SDL2Key_t SDL2xKeys[] = {
    { 12, SDLK_CLEAR },
    { 19, SDLK_PAUSE },
    { 256, SDLK_KP_0 },
    { 257, SDLK_KP_1 },
    { 258, SDLK_KP_2 },
    { 259, SDLK_KP_3 },
    { 260, SDLK_KP_4 },
    { 261, SDLK_KP_5 },
    { 262, SDLK_KP_6 },
    { 263, SDLK_KP_7 },
    { 264, SDLK_KP_8 },
    { 265, SDLK_KP_9 },
    { 266, SDLK_KP_PERIOD },
    { 267, SDLK_KP_DIVIDE },
    { 268, SDLK_KP_MULTIPLY },
    { 269, SDLK_KP_MINUS },
    { 270, SDLK_KP_PLUS },
    { 271, SDLK_KP_ENTER },
    { 272, SDLK_KP_EQUALS },
    { 273, SDLK_UP },
    { 274, SDLK_DOWN },
    { 275, SDLK_RIGHT },
    { 276, SDLK_LEFT },
    { 277, SDLK_INSERT },
    { 278, SDLK_HOME },
    { 279, SDLK_END },
    { 280, SDLK_PAGEUP },
    { 281, SDLK_PAGEDOWN },
    { 282, SDLK_F1 },
    { 283, SDLK_F2 },
    { 284, SDLK_F3 },
    { 285, SDLK_F4 },
    { 286, SDLK_F5 },
    { 287, SDLK_F6 },
    { 288, SDLK_F7 },
    { 289, SDLK_F8 },
    { 290, SDLK_F9 },
    { 291, SDLK_F10 },
    { 292, SDLK_F11 },
    { 293, SDLK_F12 },
    { 294, SDLK_F13 },
    { 295, SDLK_F14 },
    { 296, SDLK_F15 },
    { 300, SDLK_NUMLOCKCLEAR },
    { 301, SDLK_CAPSLOCK },
    { 302, SDLK_SCROLLLOCK },
    { 303, SDLK_RSHIFT },
    { 304, SDLK_LSHIFT },
    { 305, SDLK_RCTRL },
    { 306, SDLK_LCTRL },
    { 307, SDLK_RALT },
    { 308, SDLK_LALT },
    { 309, SDLK_RGUI },
    { 310, SDLK_LGUI },
    { 313, SDLK_MODE },
    { 314, SDLK_APPLICATION },
    { 315, SDLK_HELP },
    { 316, SDLK_PRINTSCREEN },
    { 317, SDLK_SYSREQ },
    { 319, SDLK_MENU },
    { 320, SDLK_POWER },
    { 322, SDLK_UNDO },
    { 0, SDLK_UNKNOWN }
};

SDLKey SDL2x_to_SDL1x_Keys(SDLKey key)
{
    int i;

    /* keys 0-255 are the same on SDL1x */
    if (key < 256) {
        return key;
    }

    /* keys 0x40000xxx need translation */
    if (key & 0x40000000) {
        for (i = 0; SDL2xKeys[i].SDL1x; ++i) {
            if (SDL2xKeys[i].SDL2x == key) {
                return SDL2xKeys[i].SDL1x;
            }
        } /* fallthrough, unknown SDL2x key */
    } else { /* SDL1 format key may come from ini file */
        for (i = 0; SDL2xKeys[i].SDL1x; ++i) {
            if (SDL2xKeys[i].SDL1x == key) {
                return SDL2xKeys[i].SDL1x;
            }
        }
    }

    /* unicode key, so return 'unknown' */
    return SDLK_UNKNOWN;
}

SDLKey SDL1x_to_SDL2x_Keys(SDLKey key)
{
    int i;

    for (i = 0; SDL2xKeys[i].SDL1x; ++i) {
        if (SDL2xKeys[i].SDL1x == key) {
            return SDL2xKeys[i].SDL2x;
        }
    }

    return key;
}
#else
SDLKey SDL2x_to_SDL1x_Keys(SDLKey key)
{
    return key;
}

SDLKey SDL1x_to_SDL2x_Keys(SDLKey key)
{
    return key;
}
#endif

static inline int sdlkbd_key_mod_to_index(SDLKey key, SDLMod mod)
{
    int i = 0;

    mod &= (KMOD_CTRL | KMOD_SHIFT | KMOD_ALT | KMOD_META);

    if (mod) {
        if (mod & KMOD_SHIFT) {
            i |= (1 << 0);
        }

        if (mod & KMOD_ALT) {
            i |= (1 << 1);
        }

        if (mod & KMOD_CTRL) {
            i |= (1 << 2);
        }

        if (mod & KMOD_META) {
            i |= (1 << 3);
        }
    }
    return (i * SDL_NUM_SCANCODES) + key;
}

static ui_menu_entry_t *sdlkbd_get_hotkey(SDLKey key, SDLMod mod)
{
    return sdlkbd_ui_hotkeys[sdlkbd_key_mod_to_index(key, mod)];
}

void sdlkbd_set_hotkey(SDLKey key, SDLMod mod, ui_menu_entry_t *value)
{
    sdlkbd_ui_hotkeys[sdlkbd_key_mod_to_index(key, mod)] = value;
	// recalc the soft buttons just in case the mapping was done there
	uibottom_must_redraw |= UIB_RECALC_SBUTTONS;
}

void sdlkbd_hotkeys_clear(void)
{
    int i;

    for (i = 0; i < SDLKBD_UI_HOTKEYS_MAX; ++i) {
       sdlkbd_ui_hotkeys[i] = NULL;
    }
}

void sdlkbd_parse_hotkey_entry(char *buffer)
{
    char *p;
    char *full_path;
    int keynum;
    ui_menu_entry_t *action;

	// If resource & cmdline init, buffer the entry for later consumption
	if (sdlkbd_log == LOG_ERR) {
		if (hotkeys_buffer)
			hotkeys_buffer=realloc(hotkeys_buffer,strlen(hotkeys_buffer)+strlen(buffer)+2);
		else { 
			hotkeys_buffer=malloc(strlen(buffer)+2);
			*hotkeys_buffer=0;
		}
		sprintf(hotkeys_buffer+strlen(hotkeys_buffer),"%s\n",buffer);
		return;
	}

	// parse and consume the entry
	p = strtok(buffer, " \t:");

    keynum = atoi(p);

    if (keynum >= SDLKBD_UI_HOTKEYS_MAX) {
        log_error(sdlkbd_log, "Too large hotkey %i!", keynum);
        return;
    }

    p = strtok(NULL, "\r\n");
    if (p != NULL) {
        full_path = lib_stralloc(p);
        action = sdl_ui_hotkey_action(p);
        if (action == NULL) {
            log_warning(sdlkbd_log, "Cannot find menu item \"%s\"!", full_path);
        } else {
           sdlkbd_set_hotkey(keynum,0,action);
        }
        lib_free(full_path);
    }
}

static void sdlkbd_hotkeys_load_from_buf() {
	char *e,*b=hotkeys_buffer;
	if (!b) return;
	sdlkbd_hotkeys_clear();
	while ((e=strchr(b,'\n'))!=NULL) {
		*e=0;
		sdlkbd_parse_hotkey_entry(b);
		*e='\n';
		b=e+1;
	}
	free(hotkeys_buffer);
	hotkeys_buffer=NULL;
}

/* ------------------------------------------------------------------------ */

ui_menu_action_t sdlkbd_press(SDLKey key, SDLMod mod)
{
    ui_menu_action_t i, retval = MENU_ACTION_NONE;
    ui_menu_entry_t *hotkey_action = NULL;

#ifdef SDL_DEBUG
    log_debug("%s: %i (%s),%i\n", __func__, key, SDL_GetKeyName(key), mod);
#endif
    if (sdl_menu_state || (uibottom_kbdactive && key == 0)) {
		if (key != SDLK_UNKNOWN) {
            for (i = MENU_ACTION_UP; i < MENU_ACTION_NUM; ++i) {
                if (sdl_ui_menukeys[i] == (int)key) {
                    retval = i;
                    break;
                }
            }
            if ((int)(key) == sdl_ui_menukeys[0]) {
                retval = MENU_ACTION_EXIT;
            }
        }
        return retval;
    }

	// autofire on
	if (key == joykeys_autofire[0]) start_autofire(0);
	if (key == joykeys_autofire[1]) start_autofire(1);

    if ((int)(key) == sdl_ui_menukeys[0]) {
        sdl_ui_activate();
        return retval;
    }

    if ((hotkey_action = sdlkbd_get_hotkey(key, mod)) != NULL) {
        sdl_ui_hotkey(hotkey_action);
        return retval;
    }

    keyboard_key_pressed((unsigned long)key);
    return retval;
}

ui_menu_action_t sdlkbd_release(SDLKey key, SDLMod mod)
{
    ui_menu_action_t i, retval = MENU_ACTION_NONE_RELEASE;

#ifdef SDL_DEBUG
    log_debug("%s: %i (%s),%i\n", __func__, key, SDL_GetKeyName(key), mod);
#endif
    if (uibottom_kbdactive && key == 0) {
        if (key != SDLK_UNKNOWN) {
            for (i = MENU_ACTION_UP; i < MENU_ACTION_NUM; ++i) {
                if (sdl_ui_menukeys[i] == (int)key) {
                    retval = i;
                    break;
                }
            }
        }
        return retval + MENU_ACTION_NONE_RELEASE;
    }

	// autofire off
	if (key == joykeys_autofire[0] && !sdl_menu_state) stop_autofire(0);
	if (key == joykeys_autofire[1] && !sdl_menu_state) stop_autofire(1);


    keyboard_key_released((unsigned long)key);
    return retval;
}

/* ------------------------------------------------------------------------ */

void kbd_arch_init(void)
{
#ifdef SDL_DEBUG
    log_debug("%s: hotkey table size %u (%lu bytes)\n", __func__, SDLKBD_UI_HOTKEYS_MAX, SDLKBD_UI_HOTKEYS_MAX * sizeof(ui_menu_entry_t *));
#endif

    sdlkbd_log = log_open("SDLKeyboard");

	// load hotkeys
	sdlkbd_hotkeys_load_from_buf();
}

signed long kbd_arch_keyname_to_keynum(char *keyname)
{
    signed long keynum = (signed long)atoi(keyname);
    if (keynum == 0) {
        log_warning(sdlkbd_log, "Keycode 0 is reserved for unknown keys.");
    }
    return keynum;
}

const char *kbd_arch_keynum_to_keyname(signed long keynum)
{
    static char keyname[20];

    memset(keyname, 0, 20);

    sprintf(keyname, "%li", keynum);

    return keyname;
}

void kbd_initialize_numpad_joykeys(int* jkeys)
{
    jkeys[0] = SDL2x_to_SDL1x_Keys(SDLK_KP0);
    jkeys[1] = SDL2x_to_SDL1x_Keys(SDLK_KP1);
    jkeys[2] = SDL2x_to_SDL1x_Keys(SDLK_KP2);
    jkeys[3] = SDL2x_to_SDL1x_Keys(SDLK_KP3);
    jkeys[4] = SDL2x_to_SDL1x_Keys(SDLK_KP4);
    jkeys[5] = SDL2x_to_SDL1x_Keys(SDLK_KP6);
    jkeys[6] = SDL2x_to_SDL1x_Keys(SDLK_KP7);
    jkeys[7] = SDL2x_to_SDL1x_Keys(SDLK_KP8);
    jkeys[8] = SDL2x_to_SDL1x_Keys(SDLK_KP9);
}

const char *get_3ds_keyname(int k)
{
	int i;
	for (i=0; buttons3ds[i].key !=0; ++i)
		if (k==buttons3ds[i].key) return buttons3ds[i].name;
	for (i=0; uikbd_keypos[i].key !=0; ++i)
		if (k==uikbd_keypos[i].key) return uikbd_keypos[i].name;
	return "unknown key";
}

const char *kbd_get_menu_keyname(void)
{
    return get_3ds_keyname(sdl_ui_menukeys[0]);
}
