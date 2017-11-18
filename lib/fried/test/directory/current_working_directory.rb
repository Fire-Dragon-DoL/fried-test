require "pathname"
require "fried/core"

module Fried::Test
  module Directory
    class CurrentWorkingDirectory
      class Substitute
        private

        attr_reader :path

        public

        def initialize(path = "/dev/null")
          @path = path
        end

        def call
          Pathname.new(path)
        end
      end

      attr_accessor :dir

      def self.build
        new.tap do |instance|
          instance.dir = Dir
        end
      end

      # @return [Pathname]
      def call
        return Pathname.new("/dev/null") if dir.nil?

        path_as_text = dir.pwd
        Pathname.new(path_as_text)
      end

      def self.call
        instance = build
        instance.()
      end
    end
  end
end
