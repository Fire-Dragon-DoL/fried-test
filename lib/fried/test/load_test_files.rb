require "fried/core"
require "fried/test/get_test_files"

module Fried::Test
  # Load test files using {require_relative}
  class LoadTestFiles
    class Substitute
      include ::Fried::Test::Telemetry

      def call
        record :call
        nil
      end
    end

    attr_accessor :get_test_files

    def initialize
      @get_test_files = GetTestFiles.new
    end

    def self.build
      new.tap do |instance|
        instance.get_test_files = GetTestFiles.build
      end
    end

    # @return [Void]
    def call
      test_files = get_test_files.()
      test_files.each { |file| require_relative file.to_s }
    end

    def self.call
      instance = build
      instance.()
    end
  end
end
