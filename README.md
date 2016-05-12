[![Build status](https://ci.appveyor.com/api/projects/status/ovvycu267x0qnqrt?svg=true)](https://ci.appveyor.com/project/cjtallman/lua-sysenv)

Example Usage
==============

~~~
local setenv = require("lua_sysenv").setenv

-- Check FOO variable doesn't exist.
assert(os.getenv("FOO") == nil)

-- Set FOO variable.
setenv("FOO", "BAR")

-- Check FOO variable was set.
assert(os.getenv("FOO") == "BAR")
~~~
