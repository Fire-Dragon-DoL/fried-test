require "fried/test/noop"

module Fried
  module Test
    class Autorun
      class Substitute
        private

        attr_reader :calls

        public

        def call
          @calls ||= 0
          @calls += 1
          nil
        end

        def was_called?(times = 1)
          calls == times
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
end
