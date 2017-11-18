require "pathname"

module Fried
  module Test
    module Directory
      # Behaves like {Dir.glob}
      class GetFilesByPattern
        class Substitute
          Args = Struct.new(:pattern, :flag)

          private

          attr_reader :files
          attr_reader :calls

          public

          def initialize(files = [])
            @files = files
            @calls = []
          end

          def call(pattern, flag = 0)
            calls << Args.new(pattern, flag)
            files.map(&:to_s)
          end

          def was_called_with?(pattern, flag = 0)
            calls.any? do |args|
              args.pattern == pattern &&
              args.flag == flag
            end
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
end
