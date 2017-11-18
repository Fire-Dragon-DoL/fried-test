require "rake"
require "fried/core"

module Fried::Test
  module Rake
    extend ::Rake::DSL

    task :test do
      lib = File.expand_path("../../../", __FILE__)
      $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

      require "fried/test"

      Fried::Test::CLI.()
    end
  end
end
