require "minitest/spec"
require "fried/core"

module Fried::Test
  class Activate
    attr_accessor :target

    def initialize
      @target = nil
    end

    def self.build
      new.tap do |instance|
        instance.target = Module
      end
    end

    # @return [void]
    def call
      return if target.nil?

      target.class_eval do
        include Minitest::Spec::DSL
      end
    end

    def self.call
      instance = build
      instance.()
    end
  end
end
