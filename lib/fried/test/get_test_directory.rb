require "pathname"
require "fried/test/directory/current_working_directory"

module Fried
  module Test
    class GetTestDirectory
      class Substitute
        private

        attr_reader :test_path

        public

        def initialize(test_path)
          @test_path = test_path
        end

        def call
          Pathname.new(test_path)
        end
      end

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
