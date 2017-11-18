module Fried
  module Test
    # Unshifts the path to {$LOAD_PATH} unless already existing
    class PrependToLoadPath
      attr_accessor :load_path

      def initialize
        @load_path = []
      end

      def self.build
        new.tap do |instance|
          instance.load_path = $LOAD_PATH
        end
      end

      # @param path [String, Pathname]
      # @return [Boolean] {true} if path was added, {false} if already present
      def call(path)
        text_path = path.to_s

        has_path = load_path.include?(text_path)
        load_path.unshift(text_path) unless has_path

        !has_path
      end

      def self.call
        instance = build
        instance.()
      end
    end
  end
end
