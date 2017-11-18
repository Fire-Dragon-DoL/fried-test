require "test_helper"
require "fried/test/get_test_directory"

class GetTestDirectorySubstituteTest < Minitest::Spec
  GetTestDirectory = Fried::Test::GetTestDirectory::Substitute

  it "is path specified in initialization" do
    get_test_directory = GetTestDirectory.new("/tmp/my/path")

    path = get_test_directory.()

    assert path.to_s == "/tmp/my/path"
  end
end
