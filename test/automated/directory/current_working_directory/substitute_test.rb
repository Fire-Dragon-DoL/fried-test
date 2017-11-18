require "test_helper"
require "fried/test/directory/current_working_directory"

class CurrentWorkingDirectorySubstituteTest < Minitest::Spec
  Directory = Fried::Test::Directory
  CurrentWorkingDirectory = Directory::CurrentWorkingDirectory::Substitute

  it "is path specified in initialization" do
    current_working_directory = CurrentWorkingDirectory.new("/tmp/my/path")

    path = current_working_directory.()

    assert path.to_s == "/tmp/my/path"
  end
end
