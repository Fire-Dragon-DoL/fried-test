require "test_helper"
require "fried/test/directory/get_files_by_pattern"

class GetFilesByPatternTest < Minitest::Spec
  GetFilesByPattern = Fried::Test::Directory::GetFilesByPattern

  it "is empty" do
    get_files_by_pattern = GetFilesByPattern.new

    files = get_files_by_pattern.("/dev/null/**/*")

    assert files.empty?
  end
end
