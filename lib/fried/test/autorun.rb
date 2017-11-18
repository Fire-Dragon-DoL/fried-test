require "fried/core"
require "fried/test/noop"
require "fried/test/telemetry"

module Fried::Test
  class Autorun
    class Substitute
      include ::Fried::Test::Telemetry

      def call
        record :call
        nil
      end
    end

    attr_accessor :execute

    def initialize
      @execute = Noop
    end

    def self.build
      new.tap do |instance|
        instance.execute = method(:require)
      end
    end

    def call
      execute.("minitest/autorun")
    end

    def self.call
      instance = build
      instance.()
    end
  end
end
