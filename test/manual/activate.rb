# run with `bundle exec ruby test/manual/activate.rb`

lib = File.expand_path("../../", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
lib = File.expand_path("../../../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "minitest/autorun"
require "test_helper"
require "fried/test"

Fried::Test.activate

module SharedTest
  it "is 1 == 1" do
    assert 1 == 1
  end
end

class RunSharedTest < Minitest::Spec
  include SharedTest
end
