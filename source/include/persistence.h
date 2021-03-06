/*
 * persistence.h - functions for gettig/setting persitent data
 *
 * Written by
 *  Sebastian weber <me@badda.de>
 *
 * This file is part of VICE3DS
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

extern char *persistence_get(char *key, char *deflt);
extern int persistence_getInt(char *key, int deflt);
extern int persistence_put(char *key, char *value);
extern int persistence_putInt(char *key, int value);
extern int persistence_remove(char *key);
extern void persistence_save(void);
