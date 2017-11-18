require "test_helper"
require "fried/test/directory/get_files_by_pattern"

class GetFilesByPatternSubstituteTest < Minitest::Spec
  Directory = Fried::Test::Directory
  GetFilesByPattern = Directory::GetFilesByPattern::Substitute

  it "is an array of strings specified in initialization" do
    get_files_by_pattern = GetFilesByPattern.new(["foo", "bar"])

    files = get_files_by_pattern.("./**/*")

    assert files == ["foo", "bar"]
  end
end
