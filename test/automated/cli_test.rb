require "test_helper"
require "fried/test/load_test_files"
require "fried/test/load_tests_path"
require "fried/test/autorun"
require "fried/test/cli"

class CLITest < Minitest::Spec
  LoadTestFiles = Fried::Test::LoadTestFiles::Substitute
  LoadTestsPath = Fried::Test::LoadTestsPath::Substitute
  Autorun = Fried::Test::Autorun::Substitute
  CLI = Fried::Test::CLI

  it "calls LoadTestsPath" do
    load_tests_path = LoadTestsPath.new
    cli = CLI.new
    cli.load_tests_path = load_tests_path

    cli.()

    assert load_tests_path.recorded_times?(:call, 1)
  end

  it "calls LoadTestFiles" do
    load_test_files = LoadTestFiles.new
    cli = CLI.new
    cli.load_test_files = load_test_files

    cli.()

    assert load_test_files.recorded_times?(:call, 1)
  end

  it "calls Autorun" do
    autorun = Autorun.new
    cli = CLI.new
    cli.autorun = autorun

    cli.()

    assert autorun.recorded_times?(:call, 1)
  end
end
