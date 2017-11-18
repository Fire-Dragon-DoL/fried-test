require "test_helper"
require "fried/test/get_test_directory"
require "fried/test/directory/current_working_directory"

class GetTestDirectoryTest < Minitest::Spec
  Directory = Fried::Test::Directory
  GetTestDirectory = Fried::Test::GetTestDirectory
  CurrentWorkingDirectory = Directory::CurrentWorkingDirectory::Substitute

  it "appends /test to current working directory" do
    current_working_directory = CurrentWorkingDirectory.new("/tmp/foo")
    get_test_directory = GetTestDirectory.new
    get_test_directory.current_working_directory = current_working_directory

    path = get_test_directory.()

    assert path.to_s == "/tmp/foo/test"
  end
end
