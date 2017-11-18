require "test_helper"
require "fried/test/directory/current_working_directory"

class CurrentWorkingDirectoryTest < Minitest::Spec
  CurrentWorkingDirectory = Fried::Test::Directory::CurrentWorkingDirectory

  it "is /dev/null" do
    current_working_directory = CurrentWorkingDirectory.new

    path = current_working_directory.()

    assert path.to_s == "/dev/null"
  end
end
