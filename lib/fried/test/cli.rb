require "fried/core"
require "fried/test/load_test_files"
require "fried/test/load_tests_path"
require "fried/test/autorun"

module Fried::Test
  class CLI
    attr_accessor :load_tests_path
    attr_accessor :load_test_files
    attr_accessor :autorun

    def initialize
      @load_tests_path = LoadTestsPath.new
      @load_test_files = LoadTestFiles.new
      @autorun = Autorun.new
    end

    def self.build
      new.tap do |instance|
        instance.load_tests_path = LoadTestsPath.build
        instance.load_test_files = LoadTestFiles.build
        instance.autorun = Autorun.build
      end
    end

    def call
      load_tests_path.()
      load_test_files.()
      autorun.()
    end

    def self.call
      instance = build
      instance.()
    end
  end
end
