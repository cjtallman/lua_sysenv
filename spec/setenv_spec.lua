
describe(".setenv", function()
    local sysenv = require("lua_sysenv")
    local setenv = sysenv.setenv

    it("is a valid type", function()
        assert.is_function(setenv)
    end)

    it("sets new variable", function()
        local var = "FOO"
        local val = "BAR"
        assert.is_nil(os.getenv(var))
        assert.is_true(setenv(var, val))
        assert.is_equal(os.getenv(var), val)
    end)

    it("sets existing variable", function()
        local var = "PATH"
        local val = "BAR"
        assert.is_string(os.getenv(var))
        assert.is_true(setenv(var, val))
        assert.is_equal(os.getenv(var), val)
    end)

    describe("throws errors", function()
        it("with 1 argument", function()
            assert.is_error(function() setenv("FOO") end)
        end)

        it("with 0 arguments", function()
            assert.is_error(function() setenv() end)
        end)

        it("with invalid argument types", function()
            assert.is_error(function() setenv(1, "BAR") end)        -- should not convert to string
            assert.is_error(function() setenv(true, "BAR") end)
            assert.is_error(function() setenv({1}, "BAR") end)
            assert.is_error(function() setenv(nil, "BAR") end)
            assert.is_error(function() setenv(function() end, "BAR") end)

            assert.is_not_error(function() setenv("FOO", 1) end)    -- able to convert to string
            assert.is_error(function() setenv("FOO", true) end)
            assert.is_error(function() setenv("FOO", {1}) end)
            assert.is_error(function() setenv("FOO", nil) end)
            assert.is_error(function() setenv("FOO", function() end) end)
        end)
    end)
end)
