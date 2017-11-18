require "pathname"
require "fried/test/directory/current_working_directory"

module Fried
  module Test
    class GetTestDirectory
      attr_accessor :current_working_directory

      def initialize
        @current_working_directory = Directory::CurrentWorkingDirectory.new
      end

      def self.build
        new.tap do |instance|
          cwd = Directory::CurrentWorkingDirectory.build

          instance.current_working_directory = cwd
        end
      end

      # @return [Pathname]
      def call
        path = current_working_directory.()
        path.join("./test")
      end

      def self.call
        instance = build
        instance.()
      end
    end
  end
end
