require "fried/core"
require "fried/test/options"

module Fried::Test
  class GetOptions
    def self.build
      new
    end

    def self.call
      instance = build
      instance.()
    end

    # @param argv [Array<String>]
    # @return [Options]
    def call(argv)
      file = ARGV.last
      Options.build(file: file)
    end
  end
end
