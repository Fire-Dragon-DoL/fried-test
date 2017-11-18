require "test_helper"
require "fried/test/prepend_to_load_path"

class PrependToLoadPathTest < Minitest::Spec
  PrependToLoadPath = Fried::Test::PrependToLoadPath

  it "adds path to load_path array" do
    load_path = []
    prepend_to_load_path = PrependToLoadPath.new
    prepend_to_load_path.load_path = load_path

    prepend_to_load_path.("foo")

    assert load_path.include?("foo")
  end

  it "doesn't add path to load_path array if already present" do
    load_path = []
    prepend_to_load_path = PrependToLoadPath.new
    prepend_to_load_path.load_path = load_path

    prepend_to_load_path.("foo")
    prepend_to_load_path.("foo")

    assert load_path == ["foo"]
  end

  it "prepends the path added to load_path array" do
    load_path = []
    prepend_to_load_path = PrependToLoadPath.new
    prepend_to_load_path.load_path = load_path

    prepend_to_load_path.("foo")
    prepend_to_load_path.("bar")

    assert load_path == ["bar", "foo"]
  end

  it "is true when path is added" do
    prepend_to_load_path = PrependToLoadPath.new

    is_appended = prepend_to_load_path.("foo")

    assert is_appended == true
  end

  it "is false when path is already present" do
    prepend_to_load_path = PrependToLoadPath.new

    prepend_to_load_path.("foo")
    is_appended = prepend_to_load_path.("foo")

    assert is_appended == false
  end
end
