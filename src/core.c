
#include <lua.h>
#include <lauxlib.h>
#include <stdlib.h>

#define STRINGIFY(x) #x

#define EXP_ARG_STR(N) "expected exactly " ## STRINGIFY(N) ## " argument(s)."
#define CHECK_ARG_COUNT(L, N) luaL_argcheck(L, (lua_gettop(L) == N), lua_gettop(L), EXP_ARG_STR(N) )

#ifndef MODULE_VER
#define MODULE_VER STRINGIFY(1.0.0)
#endif

static int Lsetenv(lua_State * L)
{
    const char * var;
    const char * val;

    CHECK_ARG_COUNT(L, 2);
    luaL_checktype(L, 1, LUA_TSTRING);

    var = luaL_checkstring(L, 1);
    val = luaL_checkstring(L, 2);

#ifdef _MSC_VER
    if(_putenv_s(var, val) == 0)
    {
        lua_pushboolean(L, 1);
        return 1;
    }
#else
    #error Unsupported Platform
#endif

    lua_pushnil(L);
    lua_pushliteral(L, "Failed to set environment variable.");
    return 2;
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
