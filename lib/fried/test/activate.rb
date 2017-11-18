require "minitest/spec"

module Fried
  module Test
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

      # @return [Void]
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
end
