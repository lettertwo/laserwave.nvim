local assert = require("luassert")

describe("test", function()
  it("should pass", function()
    assert.is_true(true, "The simple test did not pass as expected.")
  end)
end)
