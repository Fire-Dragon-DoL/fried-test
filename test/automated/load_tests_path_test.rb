require "test_helper"
require "fried/test/load_tests_path"
require "fried/test/get_test_directory"
require "fried/test/prepend_to_load_path"

class LoadTestsPathTest < Minitest::Spec
  GetTestDirectory = Fried::Test::GetTestDirectory::Substitute
  PrependToLoadPath = Fried::Test::PrependToLoadPath
  LoadTestsPath = Fried::Test::LoadTestsPath

  it "doesn't do anything" do
    load_tests_path = LoadTestsPath.new

    load_tests_path.()
  end

  it "adds test directory to load_path array" do
    load_path = []
    get_test_directory = GetTestDirectory.new("/tmp/foo")
    prepend_to_load_path = PrependToLoadPath.new
    prepend_to_load_path.load_path = load_path
    load_tests_path = LoadTestsPath.new
    load_tests_path.prepend_to_load_path = prepend_to_load_path
    load_tests_path.get_test_directory = get_test_directory

    load_tests_path.()

    assert load_path == ["/tmp/foo"]
  end
end
