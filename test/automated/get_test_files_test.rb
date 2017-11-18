require "test_helper"
require "fried/test/get_test_files"

class GetTestFilesTest < Minitest::Spec
  GetTestFiles = Fried::Test::GetTestFiles

  it "is empty" do
    get_test_files = GetTestFiles.new

    files = get_test_files.()

    assert files.to_a.empty?
  end
end
