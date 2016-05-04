package = 'lua_sysenv'
version = "scm-0"

source =
{
    url = ""
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
    modules =
    {
        ["lua_sysenv"] = "src/core.c",
    },
    type = 'builtin',
}
