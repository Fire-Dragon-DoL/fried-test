require "fried/test/get_test_directory"
require "fried/test/prepend_to_load_path"

module Fried
  module Test
    # Puts tests path into {$LOAD_PATH}
    class LoadTestsPath
      class Substitute
        def call
        end
      end

      attr_accessor :get_test_directory
      attr_accessor :prepend_to_load_path

      def initialize
        @get_test_directory = GetTestDirectory.new
        @prepend_to_load_path = PrependToLoadPath.new
      end

      def self.build
        new.tap do |instance|
          instance.get_test_directory = GetTestDirectory.build
          instance.prepend_to_load_path = PrependToLoadPath.build
        end
      end

      # @param [Void]
      def call
        lib = get_test_directory.()
        prepend_to_load_path.(lib)
      end

      def self.call
        instance = build
        instance.()
      end
    end
  end
end
