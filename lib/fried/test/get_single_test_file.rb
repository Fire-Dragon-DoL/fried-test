require "fried/core"
require "fried/test/directory/current_working_directory"

module Fried::Test
  class GetSingleTestFile
    CurrentWorkingDirectory = Directory::CurrentWorkingDirectory

    attr_accessor :current_working_directory

    def initialize
      self.current_working_directory = CurrentWorkingDirectory.new
    end

    def self.build
      new.tap do |instance|
        instance.current_working_directory = CurrentWorkingDirectory.build
      end
    end

    def self.call(file)
      instance = build
      instance.(file)
    end

    # @param file [String]
    # @return [Array<Pathname>]
    def call(file)
      directory = current_working_directory.()
      test_file_path = directory.join(file.to_s)

      [test_file_path]
    end
  end
end
