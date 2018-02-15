require "fried/core"

module Fried::Test
  class LoadPlugins
    def self.build
      new
    end

    def self.call
      instance = build
      instance.()
    end

    # @return [void]
    def call
      require "minitest/spec"
      require "minitest/focus"
      require "minitest/reporters"
      reporter = Minitest::Reporters::ProgressReporter.new
      Minitest::Reporters.use!(reporter)
    end
  end
end
