
#include <lua.h>
#include <lauxlib.h>
#include <stdlib.h>

#define STR(x) #x
#define MODULE_VER STR(1.0.0)

#ifdef _MSC_VER
#define PUTENV _putenv_s
#else
#error Unsupported Platform
#endif

static int Lsetenv(lua_State * L)
{
    const char * var = luaL_checkstring(L, 1);
    const char * val = luaL_checkstring(L, 2);

    PUTENV(var, val);

    return 0;
}

int luaopen_lua_sysenv(lua_State * L)
{
    lua_newtable(L);

    lua_pushcfunction(L, Lsetenv);
    lua_setfield(L, -2, "setenv");

    lua_pushliteral(L, MODULE_VER);
    lua_setfield(L, -2, "VERSION");

    return 1;
}
