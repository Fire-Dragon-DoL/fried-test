require "test_helper"
require "fried/test/load_test_files"

class LoadTestFilesTest < Minitest::Spec
  LoadTestFiles = Fried::Test::LoadTestFiles

  it "doesn't do anything" do
    load_test_files = LoadTestFiles.new

    load_test_files.()
  end
end
