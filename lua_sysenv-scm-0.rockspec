package = "lua_sysenv"
version = "scm-0"

source =
{
    url = "git://github.com/cjtallman/lua_sysenv",
    branch = "master",
}

description =
{
    license  = "MIT/X11",
}

supported_platforms =
{
    "windows",
    "win32",
    "cygwin",
}

dependencies =
{
    "lua ~> 5.1"
}

build =
{
    type ="builtin",
    modules =
    {
        ["lua_sysenv"] =
        {
            sources = "src/core.c",
            defines = ([[MODULE_VER="%s"]]):format(version),
        }
    },
}
