require "pathname"

module Fried
  module Test
    module Directory
      # Behaves like {Dir.glob}
      class GetFilesByPattern
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
end
