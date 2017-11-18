require "fried/test/noop"

module Fried
  module Test
    class Autorun
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
end
