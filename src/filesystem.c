/**
This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

#ifndef KBOX_FILESYSTEM
#define KBOX_FILESYSTEM

#ifdef WIN32
#error "Windows is not supported."
#else

#define LUAL_REG(xxx, xxc) lua_register(L, xxx, xxc)

#include <lua5.3/lualib.h>
#include <lua5.3/lauxlib.h>
#include <lua5.3/lua.h>

#include <readline/readline.h>
#include <readline/history.h>
#include <malloc.h>

const char *fSTyPE = "drive";
#define FS_OK 0x0001

#define luaL_return(str) luaLpushstring(L, str)


#define FILESYSTEM_REGISTER(XXX) int XXX(lua_State* L)


//sets the fstype
FILESYSTEM_REGISTER(set_fstype) {
    fSTyPE = luaL_checkstring(L, 1);
    return FS_OK;
}

FILESYSTEM_REGISTER(get_fstype) {
    printf("%s", fSTyPE);
    return FS_OK;
}
// local b = readline("Hello: ")
FILESYSTEM_REGISTER(readline_p) {
    const char *C = readline(luaL_checkstring(L, 1));
    add_history(C);
    lua_pushstring(L, C);
    return FS_OK;
}

// getchar();
FILESYSTEM_REGISTER(getchar_p) {
    lua_pushvalue(L, getchar());
    return FS_OK;
}

// Print an error
// seterr("Error!");
FILESYSTEM_REGISTER(seterr) {
    luaL_error(L, luaL_checkstring(L, 1));
    return FS_OK;
}
// Checks the sum of both arguments
// checksum(1, 2) = 3
FILESYSTEM_REGISTER(checksum) {
    lua_pushinteger(L, luaL_checkinteger(L, 1) + luaL_checkinteger(L, 2));
    return FS_OK;
}

// Checks the value and returns of the first parameter.
// checkvalue(1 + 1) - 2
FILESYSTEM_REGISTER(checkvalue) {
    lua_pushinteger(L, 1);
    return FS_OK;
}

// Calls a function as many times as the parameters suggest.
// CIter(2,PrintHello)
FILESYSTEM_REGISTER(CIter) {
    for (int i = 0; i < luaL_checkinteger(L, 1); ++i) {
        lua_call(L, 0, 0);
    }
    return FS_OK;
}

FILESYSTEM_REGISTER(Estring)
{
    luaL_dostring(L, luaL_checkstring(L, 1));
    return FS_OK;
}

FILESYSTEM_REGISTER(chvidmem)
{
    malloc(luaL_checkinteger(L, 1));
    return FS_OK;
}
FILESYSTEM_REGISTER(freemem)
{
    free((void*) luaL_checkinteger(L, 1));
    return FS_OK;
}
// Register all of the filesystem functions
FILESYSTEM_REGISTER(luaopen_filesystem) {

    LUAL_REG("fssettype", set_fstype);

    LUAL_REG("free", freemem);

    LUAL_REG("malloc", chvidmem);

    LUAL_REG("evstr", Estring);

    LUAL_REG("chexec", CIter);

    LUAL_REG("checkvalue", checkvalue);

    LUAL_REG("checksum", checksum);

    LUAL_REG("getchar", getchar_p);

    LUAL_REG("readline", readline_p);

    LUAL_REG("ferr",seterr);

    LUAL_REG("fsgettype", get_fstype);

    return FS_OK;

}

#endif
#endif