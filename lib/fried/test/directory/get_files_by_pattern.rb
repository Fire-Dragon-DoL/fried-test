require "pathname"
require "fried/core"
require "fried/test/telemetry"

module Fried::Test
  module Directory
    # Behaves like {Dir.glob}
    class GetFilesByPattern
      class Substitute
        include ::Fried::Test::Telemetry

        private

        attr_reader :files

        public

        def initialize(files = [])
          @files = files
        end

        def call(pattern, flag = 0)
          record :call, [pattern, flag]
          files.map(&:to_s)
        end
      end

      attr_accessor :dir

      def self.build
        new.tap do |instance|
          instance.dir = Dir
        end
      end

      # @see Dir.glob
      # @return [Array<String>]
      def call(pattern, flags = 0)
        return [] if dir.nil?

        dir.glob(pattern, flags)
      end

      def self.call
        instance = build
        instance.()
      end
    end
  end
end
