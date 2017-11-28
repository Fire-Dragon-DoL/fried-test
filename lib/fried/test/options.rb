require "fried/core"

module Fried::Test
  class Options
    Default = new.freeze

    attr_accessor :file

    def self.build(file: nil)
      new.tap do |instance|
        instance.file = file
      end
    end

    def single_file?
      !file.nil?
    end
  end
end
