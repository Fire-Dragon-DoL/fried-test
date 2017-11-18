require "rake"
require "fried/core"

module Fried::Test
  module Rake
    def self.included(klass)
      klass.class_eval do
        include ::Rake::DSL
      end

      task :test do
        lib = File.expand_path("../../../", __FILE__)
        $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

        require "fried/test"

        Fried::Test::CLI.()
      end
    end
  end
end
