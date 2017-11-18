require "fried/test/version"
require "fried/test/activate"

module Fried
  module Test
    module_function

    def activate
      Activate.()
    end
  end
end
