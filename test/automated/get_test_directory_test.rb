require "test_helper"
require "fried/test/get_test_directory"

class GetTestDirectoryTest < Minitest::Spec
  GetTestDirectory = Fried::Test::GetTestDirectory

  it "doesn't do anything" do
    get_test_directory = GetTestDirectory.new

    path = get_test_directory.()

    assert path.to_s == "/dev/null/test"
  end
end
