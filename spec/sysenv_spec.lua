
describe(".VERSION", function()
    local sysenv = require("lua_sysenv")

    it("is valid type", function()
        assert.is_string(sysenv.VERSION)
    end)
end)
