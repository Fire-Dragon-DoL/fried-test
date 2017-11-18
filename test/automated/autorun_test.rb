require "test_helper"
require "fried/test/autorun"

class AutorunTest < Minitest::Spec
  Autorun = Fried::Test::Autorun

  it "doesn't do anything" do
    autorun = Autorun.new

    autorun.()
  end
end
