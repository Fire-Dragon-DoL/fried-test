require "fried/core"
require "fried/test/get_test_files"
require "fried/test/options"

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

    def self.call(options = Options::Default)
      instance = build
      instance.(options)
    end

    # @return [void]
    def call(options = Options::Default)
      test_files = fetch_files(options)
      test_files.each { |file| require_relative file.to_s }
    end

    private

    def fetch_files(options)
      if options.single_file?
        get_single_test_file.(options.file)
      else
        get_test_files.()
      end
    end
  end
end
