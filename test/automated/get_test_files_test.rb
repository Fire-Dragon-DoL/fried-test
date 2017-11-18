require "test_helper"
require "fried/test/get_test_files"
require "fried/test/get_test_directory"
require "fried/test/directory/get_files_by_pattern"

class GetTestFilesTest < Minitest::Spec
  Directory = Fried::Test::Directory
  GetFilesByPattern = Directory::GetFilesByPattern::Substitute
  GetTestDirectory = Fried::Test::GetTestDirectory::Substitute
  GetTestFiles = Fried::Test::GetTestFiles

  it "is empty" do
    get_test_files = GetTestFiles.new

    files = get_test_files.()
    files = files.to_a

    assert files.empty?
  end

  it "searches for files in test directory" do
    get_test_directory = GetTestDirectory.new("/tmp/foo/test")
    get_files_by_pattern = GetFilesByPattern.new(["foo", "bar"])
    get_test_files = GetTestFiles.new
    get_test_files.get_files_by_pattern = get_files_by_pattern
    get_test_files.get_test_directory = get_test_directory
    pattern = "/tmp/foo/test/**/*_test.rb"

    get_test_files.()

    assert get_files_by_pattern.was_called_with?(pattern)
  end

  it "searches for files in test directory" do
    get_test_directory = GetTestDirectory.new("/tmp/foo/test")
    get_files_by_pattern = GetFilesByPattern.new(["foo", "bar"])
    get_test_files = GetTestFiles.new
    get_test_files.get_files_by_pattern = get_files_by_pattern
    get_test_files.get_test_directory = get_test_directory
    found_files = [
      Pathname.new("/tmp/foo/test/foo"),
      Pathname.new("/tmp/foo/test/bar")
    ]

    files = get_test_files.()
    files = files.to_a

    assert files == found_files
  end
end
