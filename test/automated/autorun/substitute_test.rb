require "test_helper"
require "fried/test/autorun"

class AutorunSubstituteTest < Minitest::Spec
  Autorun = Fried::Test::Autorun::Substitute

  it "records if it was called" do
    autorun = Autorun.new

    autorun.()

    assert autorun.was_called?
  end
end
