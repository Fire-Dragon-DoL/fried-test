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

  it "keeps track of invocation arguments" do
    get_files_by_pattern = GetFilesByPattern.new(["foo", "bar"])

    get_files_by_pattern.("./foo/*_.baz", 1)

    assert get_files_by_pattern.was_called_with?("./foo/*_.baz", 1)
  end

  it "keeps track of multiple invocations" do
    get_files_by_pattern = GetFilesByPattern.new(["foo", "bar"])

    get_files_by_pattern.("./foo/*_.baz", 1)
    get_files_by_pattern.("./**/*")

    assert get_files_by_pattern.was_called_with?("./foo/*_.baz", 1)
  end
end
