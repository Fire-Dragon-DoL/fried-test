require "test_helper"
require "fried/test/activate"
require "minitest/spec"

class ActivateTest < Minitest::Spec
  Activate = Fried::Test::Activate

  it "doesn't do anything" do
    activate = Activate.new

    activate.()
  end

  it "adds Minitest::Spec::DSL to given module" do
    mod = Module.new
    activate = Activate.new
    activate.target = mod

    activate.()

    assert mod.ancestors.include?(Minitest::Spec::DSL)
  end
end
