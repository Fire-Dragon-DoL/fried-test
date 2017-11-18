require "pathname"
require "fried/test/directory/get_files_by_pattern"
require "fried/test/get_test_directory"

module Fried
  module Test
    # Get absolute path to all test files for current working directory
    class GetTestFiles
      GlobPattern = Pathname.new("./**/*_test.rb").freeze

      attr_accessor :get_files_by_pattern
      attr_accessor :get_test_directory

      def initialize
        @get_files_by_pattern = Directory::GetFilesByPattern.new
        @get_test_directory = GetTestDirectory.new
      end

      def self.build
        new.tap do |instance|
          instance.get_files_by_pattern = Directory::GetFilesByPattern.build
          instance.get_test_directory = GetTestDirectory.build
        end
      end

      # @return [Enumerator<Pathname>]
      def call
        directory = get_test_directory.()
        pattern = directory.join(GlobPattern)

        files = get_files_by_pattern.(pattern.to_s)
        files.map! { |file| directory.join(file) }
        files.each
      end

      def self.call
        instance = build
        instance.()
      end
    end
  end
end
