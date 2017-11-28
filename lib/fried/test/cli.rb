require "fried/core"
require "fried/test/load_test_files"
require "fried/test/load_tests_path"
require "fried/test/autorun"
require "fried/test/get_options"

module Fried::Test
  class CLI
    attr_accessor :load_tests_path
    attr_accessor :load_test_files
    attr_accessor :autorun
    attr_accessor :get_options

    def initialize
      @load_tests_path = LoadTestsPath.new
      @load_test_files = LoadTestFiles.new
      @autorun = Autorun.new
      @get_options = GetOptions.new
    end

    def self.build
      new.tap do |instance|
        instance.load_tests_path = LoadTestsPath.build
        instance.load_test_files = LoadTestFiles.build
        instance.autorun = Autorun.build
        instance.get_options = GetOptions.build
      end
    end

    def call(argv = ARGV)
      options = get_options.(argv)
      load_tests_path.()
      load_test_files.(options)
      autorun.()
    end

    def self.call(argv = ARGV)
      instance = build
      instance.(argv)
    end
  end
end
