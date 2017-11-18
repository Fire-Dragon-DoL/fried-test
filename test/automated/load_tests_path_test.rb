require "test_helper"
require "fried/test/load_tests_path"

class LoadTestsPathTest < Minitest::Spec
  LoadTestsPath = Fried::Test::LoadTestsPath

  it "doesn't do anything" do
    load_tests_path = LoadTestsPath.new

    load_tests_path.()
  end
end
